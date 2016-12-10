#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

extern crate json;

agent! {
  todo_get_id, edges(todo, generic_text)
  inputs(old: todo, new: generic_text),
  inputs_array(),
  outputs(todo: todo),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut ip = self.ports.recv("old")?;
      {
          let mut builder = ip.edit_schema::<todo::Builder, todo::Reader>()?;

          let mut new_ip = self.ports.recv("new")?;
          let reader: generic_text::Reader = new_ip.read_schema()?;

          let json = json::parse(reader.get_text()?).or(Err(result::Error::Misc("cannot parse".into())))?;

          if !json["title"].is_null() {
              builder.set_title(json["title"].as_str().ok_or(result::Error::Misc("not a str title".into()))?);
          }

          if !json["order"].is_null() {
              builder.set_order(json["order"].as_u64().ok_or(result::Error::Misc("not a u64 order".into()))?);
          }

          if !json["completed"].is_null() {
              builder.set_completed(json["completed"].as_bool().ok_or(result::Error::Misc("not a bool completed".into()))?);
          }
      }
      self.ports.send("todo", ip)?;

      Ok(())
  }
}
