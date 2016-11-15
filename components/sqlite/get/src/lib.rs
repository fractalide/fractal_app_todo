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

component! {
  sqlite_read, contracts(generic_text, path)
  inputs(get: generic_text, db_path: path),
  inputs_array(),
  outputs(response: any, error: generic_text, id: generic_text),
  outputs_array(),
  option(generic_text),
  acc(), portal(Portal => Portal::new())
  fn run(&mut self) -> Result<()> {
      let mut opt = self.recv_option();
      let table = {
          let reader: generic_text::Reader = opt.get_root()?;
          reader.get_text()?
      };
      if let Ok(mut ip) = self.ports.try_recv("db_path") {
          let reader: path::Reader = ip.get_root()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.portal.conn = Some(conn);
      }

      if let Ok(mut ip) = self.ports.try_recv("get") {
          let mut ok = false;
          if let Some(ref conn) = self.portal.conn {
              let reader: generic_text::Reader = ip.get_root()?;
              let sql = format!("SELECT ip FROM {} WHERE ID=$1", table);
              let mut stmt = conn.prepare(&sql)
                  .or(Err(result::Error::Misc("cannot prepare".into())))?;
              let id = reader.get_text()?;
              let mut rows = stmt.query(&[&id])
                  .or(Err(result::Error::Misc("cannot query".into())))?;
              if let Some(res) = rows.next() {
                  // there is an IP
                  let res = res.or(Err(result::Error::Misc("row error".into())))?;
                  let mut ip = IP::new();
                  ip.vec = res.get(0);
                  self.ports.send("response", ip)?;
                  ok = true;
              }
          }
          if !ok {
              // There is no IP
              let _ = self.ports.send("error", ip);
          } else {
              let _ = self.ports.send("id", ip);
          }
      }
      Ok(())
  }
}
