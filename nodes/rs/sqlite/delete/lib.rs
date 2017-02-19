#[macro_use]
extern crate rustfbp;
extern crate capnp;

extern crate rusqlite;
use rusqlite::Connection;

use std::path::Path;

pub struct State {
    conn: Option<Connection>,
}

impl State {
    fn new() -> Self {
        State {
            conn: None,
        }
    }
}

agent! {
  input(delete: prim_text, db_path: fs_path),
  output(response: any),
  state(State => State::new()),
  option(prim_text),
  fn run(&mut self) -> Result<Signal> {
      let mut opt = self.recv_option();
      let table = {
          let reader: prim_text::Reader = opt.read_schema()?;
          reader.get_text()?
      };
      if let Ok(mut ip) = self.input.db_path.try_recv() {
          let reader: fs_path::Reader = ip.read_schema()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.state.conn = Some(conn);
      }

      if let Ok(mut ip) = self.input.delete.try_recv() {
          if let Some(ref conn) = self.state.conn {
              {
                  let reader: prim_text::Reader = ip.read_schema()?;
                  let id = reader.get_text()?;
                  let sql = format!("DELETE FROM {} WHERE ID=$1", table);
                  conn.execute(&sql, &[&id])
                      .or(Err(result::Error::Misc("cannot delete".into())))?;
              }
              self.output.response.send(ip)?;
          }
      }
      Ok(End)
  }
}
