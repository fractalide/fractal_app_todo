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
  sqlite_insert, contracts(generic_text, path)
  inputs(insert: any, db_path: path),
  inputs_array(),
  outputs(response: any),
  outputs_array(),
  option(generic_text),
  acc(), portal(Portal => Portal::new())
  fn run(&mut self) -> Result<()> {
      let mut opt = self.recv_option();
      let table = {
          let reader: generic_text::Reader = opt.read_contract()?;
          reader.get_text()?
      };
      if let Ok(mut ip) = self.ports.try_recv("db_path") {
          let reader: path::Reader = ip.read_contract()?;
          let conn = Connection::open(Path::new(reader.get_path()?)).or(Err(result::Error::Misc("Cannot open the db".into())))?;
          self.portal.conn = Some(conn);
      }

      if let Ok(ip) = self.ports.try_recv("insert") {
          if let Some(ref conn) = self.portal.conn {
              let sql = format!("INSERT INTO {} (IP) VALUES ($1)", table);
              conn.execute(&sql, &[&ip.vec])
                  .or(Err(result::Error::Misc("cannot execute".into())))?;
              let mut stmt = conn.prepare("SELECT seq FROM sqlite_sequence WHERE name=$1")
                  .or(Err(result::Error::Misc("cannot prepare".into())))?;
              let mut rows = stmt.query(&[&table])
                  .or(Err(result::Error::Misc("cannot query".into())))?;
              if let Some(res) = rows.next() {
                  // there is an IP
                  let res = res.or(Err(result::Error::Misc("row error".into())))?;
                  let mut ip = IP::new();
                  {
                      let mut builder: generic_text::Builder = ip.build_contract();
                      let id: i64 = res.get(0);
                      let id: String = format!("{}", id);
                      builder.set_text(&id);
                  }
                  self.ports.send("response", ip)?;
              }
          }
      }
      Ok(())
  }
}
