#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(input: request),
  output(req_id: generic_u64, id: generic_text),
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
      self.output.id.send(new_msg);

      let mut new_msg = Msg::new();
      {
          let mut builder: generic_u64::Builder = new_msg.build_schema();
          builder.set_number(reader.get_id());
      }
      self.output.req_id.send(new_msg);
      Ok(End)
  }
}
