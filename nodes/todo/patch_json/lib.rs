#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate json;

agent! {
  input(old: todo, new: prim_text),
  output(todo: todo),
  fn run(&mut self) -> Result<Signal> {
      let mut msg = self.input.old.recv()?;
      {
          let mut builder = msg.edit_schema::<todo::Builder, todo::Reader>()?;

          let mut new_msg = self.input.new.recv()?;
          let reader: prim_text::Reader = new_msg.read_schema()?;

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
      self.output.todo.send(msg)?;
      Ok(End)
  }
}
