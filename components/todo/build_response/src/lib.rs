#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  todo_get_id, contracts(generic_text, response)
  inputs(playload: generic_text, error: generic_text),
  inputs_array(),
  outputs(response: response),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      if let Ok(mut ip) = self.ports.try_recv("playload") {
          let reader: generic_text::Reader = ip.read_contract()?;

          let mut new_ip = IP::new();
          {
              let mut builder: response::Builder = new_ip.build_contract();
              builder.set_response(reader.get_text()?);
          }
          self.ports.send("response", new_ip);
      }

      if let Ok(mut ip) = self.ports.try_recv("error") {
          let mut new_ip = IP::new();
          {
              let mut builder: response::Builder = new_ip.build_contract();
              builder.set_response("Not found");
              builder.set_status_code(404);
          }
          self.ports.send("response", new_ip);
      }

      Ok(())
  }
}
