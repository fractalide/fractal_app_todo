#[macro_use]
extern crate rustfbp;
extern crate capnp;
#[macro_use]
extern crate json;

agent! {
  input(id: prim_text, todo: app_todo),
  output(json: prim_text),
  fn run(&mut self) -> Result<Signal> {
      let mut msg_id = self.input.id.recv()?;
      let reader: prim_text::Reader = msg_id.read_schema()?;

      let mut msg_todo = self.input.todo.recv()?;
      let todo_reader: app_todo::Reader = msg_todo.read_schema()?;

      let id = reader.get_text()?;
      let inst = object![
          "id" => id,
          "title" => todo_reader.get_title()?,
          "order" => todo_reader.get_order(),
          "completed" => todo_reader.get_completed()
      ];

      let mut msg = Msg::new();
      {
          let mut builder: prim_text::Builder = msg.build_schema();
          builder.set_text(&inst.dump());
      }
      self.output.json.send(msg);
      Ok(End)
  }
}
