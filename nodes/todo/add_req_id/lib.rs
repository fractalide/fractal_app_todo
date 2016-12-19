#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(id: generic_u64, response: response),
  output(response: response),
  fn run(&mut self) -> Result<Signal> {
      let mut msg = self.input.id.recv()?;
      let reader: generic_u64::Reader = msg.read_schema()?;

      let mut msg_pl = self.input.response.recv()?;
      {
          let mut builder = msg_pl.edit_schema::<response::Builder, response::Reader>()?;
          builder.set_id(reader.get_number());
      }
      self.output.response.send(msg_pl);

      Ok(End)
  }
}
