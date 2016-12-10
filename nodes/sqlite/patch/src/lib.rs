#![feature(question_mark)]
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
  sqlite_insert, edges(generic_text, path)
  inputs(ip: any, id: generic_text, db_path: path),
  inputs_array(),
  outputs(response: any),
  outputs_array(),
  option(generic_text),
  acc(), portal(Portal => Portal::new())
  fn run(&mut self) -> Result<()> {
      let mut opt = self.recv_option();
      let table = {
          let reader: generic_text::Reader = opt.read_schema()?;
          reader.get_text()?
      };
      if let Ok(mut ip) = self.ports.try_recv("db_path") {
          let reader: path::Reader = ip.read_schema()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.portal.conn = Some(conn);
      }

      if let Ok(ip) = self.ports.try_recv("ip") {
          let mut id_ip = self.ports.recv("id")?;
          let id = {
              let r: generic_text::Reader = id_ip.read_schema()?;
              r.get_text()?
          };
          if let Some(ref conn) = self.portal.conn {
              let sql = format!("UPDATE {} SET IP=$1 WHERE ID=$2", table);
              conn.execute(&sql, &[&ip.vec, &id])
                  .or(Err(result::Error::Misc("cannot execute".into())))?;
              self.ports.send("response", ip)?;
          }
      }
      Ok(())
  }
}
