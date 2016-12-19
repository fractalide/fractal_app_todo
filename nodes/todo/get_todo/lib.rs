#[macro_use]
extern crate rustfbp;
extern crate capnp;
extern crate json;

agent! {
  input(input: request),
  output(req_id: generic_u64, id: generic_text, todo: todo, raw_todo: generic_text),
  fn run(&mut self) -> Result<Signal> {
      let mut msg = self.input.input.recv()?;
      let reader: request::Reader = msg.read_schema()?;

      let mut new_msg = Msg::new();
      {
          let mut builder: generic_text::Builder = new_msg.build_schema();
          let url = reader.get_url()?;
          if let Some(ref id) = url.split("/").last() {
              builder.set_text(id);
          }
      }
      let _ = self.output.id.send(new_msg);

      let mut new_msg = Msg::new();
      {
          let mut builder: generic_u64::Builder = new_msg.build_schema();
          builder.set_number(reader.get_id());
      }
      let _ = self.output.req_id.send(new_msg);

      let mut new_msg = Msg::new();
      {
          let mut builder: generic_text::Builder = new_msg.build_schema();
          builder.set_text(reader.get_content()?);
      }
      let _ = self.output.raw_todo.send(new_msg);

      let mut new_msg = Msg::new();
      {
          let mut builder: todo::Builder = new_msg.build_schema();
          let json = reader.get_content()?;
          let json = json::parse(json).or(Err(result::Error::Misc("cannot parse json".into())))?;

          if json["id"].is_null() {
              builder.set_id(0 as u64);
          } else {
              builder.set_id(json["id"].as_u64().ok_or(result::Error::Misc("Id is not u64".into()))?);
          }

          if json["title"].is_null() {
              builder.set_title("");
          } else {
              builder.set_title(json["title"].as_str().ok_or(result::Error::Misc("title is not a str".into()))?);
          }

          if json["order"].is_null() {
              builder.set_order(0 as u64);
          } else {
              builder.set_order(json["order"].as_u64().ok_or(result::Error::Misc("Order is not a u64".into()))?);
          }

          if json["completed"].is_null() {
              builder.set_completed(false);
          } else {
              builder.set_completed(json["completed"].as_bool().ok_or(result::Error::Misc("Completed is not a bool)".into()))?);
          }
      }
      let _ = self.output.todo.send(new_msg);
      Ok(End)
  }
}
