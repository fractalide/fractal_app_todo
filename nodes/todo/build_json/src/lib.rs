#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;
#[macro_use]
extern crate json;

agent! {
  todo_get_todo, edges(generic_text, todo)
  inputs(id: generic_text, todo: todo),
  inputs_array(),
  outputs(json: generic_text),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut ip_id = self.ports.recv("id")?;
      let reader: generic_text::Reader = ip_id.read_schema()?;

      let mut ip_todo = self.ports.recv("todo")?;
      let todo_reader: todo::Reader = ip_todo.read_schema()?;

      let id = reader.get_text()?;
      let inst = object![
          "id" => id,
          "title" => todo_reader.get_title()?,
          "order" => todo_reader.get_order(),
          "completed" => todo_reader.get_completed()
      ];

      let mut ip = IP::new();
      {
          let mut builder: generic_text::Builder = ip.build_schema();
          builder.set_text(&inst.dump());
      }
      self.ports.send("json", ip);
      Ok(())
  }
}
