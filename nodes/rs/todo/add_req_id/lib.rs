#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(id: prim_u64, response: net_http_response),
  output(response: net_http_response),
  fn run(&mut self) -> Result<Signal> {
      let mut msg = self.input.id.recv()?;
      let reader: prim_u64::Reader = msg.read_schema()?;

      let mut msg_pl = self.input.response.recv()?;
      {
          let mut builder = msg_pl.edit_schema::<net_http_response::Builder, net_http_response::Reader>()?;
          builder.set_id(reader.get_u64());
      }
      self.output.response.send(msg_pl);

      Ok(End)
  }
}
