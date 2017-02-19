#[macro_use]
extern crate rustfbp;
extern crate capnp;

agent! {
  input(playload: prim_text, error: prim_text),
  output(response: net_http_response),
  fn run(&mut self) -> Result<Signal> {
      if let Ok(mut msg) = self.input.playload.try_recv() {
          let reader: prim_text::Reader = msg.read_schema()?;

          let mut new_msg = Msg::new();
          {
              let mut builder: net_http_response::Builder = new_msg.build_schema();
              builder.set_response(reader.get_text()?);
          }
          self.output.response.send(new_msg);
      }

      if let Ok(mut msg) = self.input.error.try_recv() {
          let mut new_msg = Msg::new();
          {
              let mut builder: net_http_response::Builder = new_msg.build_schema();
              builder.set_response("Not found");
              builder.set_status_code(404);
          }
          self.output.response.send(new_msg);
      }

      Ok(End)
  }
}
