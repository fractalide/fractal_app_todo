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
  input(get: prim_text, db_path: fs_path),
  output(response: any, error: prim_text, id: prim_text),
  portal(Portal => Portal::new()),
  option(prim_text),
  fn run(&mut self) -> Result<Signal> {
      let mut opt = self.recv_option();
      let table = {
          let reader: prim_text::Reader = opt.read_schema()?;
          reader.get_text()?
      };
      if let Ok(mut msg) = self.input.db_path.try_recv() {
          let reader: fs_path::Reader = msg.read_schema()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.portal.conn = Some(conn);
      }

      if let Ok(mut msg) = self.input.get.try_recv() {
          let mut ok = false;
          if let Some(ref conn) = self.portal.conn {
              let reader: prim_text::Reader = msg.read_schema()?;
              let sql = format!("SELECT ip FROM {} WHERE ID=$1", table);
              let mut stmt = conn.prepare(&sql)
                  .or(Err(result::Error::Misc("cannot prepare".into())))?;
              let id = reader.get_text()?;
              let mut rows = stmt.query(&[&id])
                  .or(Err(result::Error::Misc("cannot query".into())))?;
              if let Some(res) = rows.next() {
                  // there is an IP
                  let res = res.or(Err(result::Error::Misc("row error".into())))?;
                  let mut msg = Msg::new();
                  msg.vec = res.get(0);
                  self.output.response.send(msg)?;
                  ok = true;
              }
          }
          if !ok {
              // There is no Msg
              let _ = self.output.error.send(msg);
          } else {
              let _ = self.output.id.send(msg);
          }
      }
      Ok(End)
  }
}
