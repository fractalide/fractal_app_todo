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
  input(msg: any, id: prim_text, db_path: fs_path),
  output(response: any),
  portal(Portal => Portal::new()),
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
          self.portal.conn = Some(conn);
      }

      if let Ok(ip) = self.input.msg.try_recv() {
          let mut id_ip = self.input.id.recv()?;
          let id = {
              let r: prim_text::Reader = id_ip.read_schema()?;
              r.get_text()?
          };
          if let Some(ref conn) = self.portal.conn {
              let sql = format!("UPDATE {} SET IP=$1 WHERE ID=$2", table);
              conn.execute(&sql, &[&ip.vec, &id])
                  .or(Err(result::Error::Misc("cannot execute".into())))?;
              self.output.response.send(ip)?;
          }
      }
      Ok(End)
  }
}
