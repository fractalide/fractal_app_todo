#[macro_use]
extern crate rustfbp;
extern crate capnp;

extern crate rusqlite;
use rusqlite::Connection;

use std::path::Path;

pub struct Portal {
    conn: Option<Connection>,
}

impl Portal {
    fn new() -> Self {
        Portal {
            conn: None,
        }
    }
}

agent! {
  input(insert: any, db_path: path),
  output(response: any),
  portal(Portal => Portal::new()),
  option(generic_text),
  fn run(&mut self) -> Result<Signal> {
      let mut opt = self.recv_option();
      let table = {
          let reader: generic_text::Reader = opt.read_schema()?;
          reader.get_text()?
      };
      if let Ok(mut msg) = self.input.db_path.try_recv() {
          let reader: path::Reader = msg.read_schema()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.portal.conn = Some(conn);
      }

      if let Ok(msg) = self.input.insert.try_recv() {
          if let Some(ref conn) = self.portal.conn {
              let sql = format!("INSERT INTO {} (IP) VALUES ($1)", table);
              conn.execute(&sql, &[&msg.vec])
                  .or(Err(result::Error::Misc("cannot execute".into())))?;
              let mut stmt = conn.prepare("SELECT seq FROM sqlite_sequence WHERE name=$1")
                  .or(Err(result::Error::Misc("cannot prepare".into())))?;
              let mut rows = stmt.query(&[&table])
                  .or(Err(result::Error::Misc("cannot query".into())))?;
              if let Some(res) = rows.next() {
                  // there is an IP
                  let res = res.or(Err(result::Error::Misc("row error".into())))?;
                  let mut msg = Msg::new();
                  {
                      let mut builder: generic_text::Builder = msg.build_schema();
                      let id: i64 = res.get(0);
                      let id: String = format!("{}", id);
                      builder.set_text(&id);
                  }
                  self.output.response.send(msg)?;
              }
          }
      }
      Ok(End)
  }
}
