#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  todo_get_id, contracts(generic_text, generic_u64, response)
  inputs(id: generic_u64, playload: generic_text, error: generic_text),
  inputs_array(),
  outputs(response: response),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut ip = self.ports.recv("id")?;
      let reader: generic_u64::Reader = ip.get_root()?;

      let mut ip_pl = self.ports.recv("playload")?;
      let pl_reader: generic_text::Reader = ip_pl.get_root()?;

      println!("Build response {} : {}", reader.get_number(), pl_reader.get_text()?);

      let mut new_ip = IP::new();
      {
          let mut builder: response::Builder = new_ip.init_root();
          builder.set_id(reader.get_number());
          builder.set_response(pl_reader.get_text()?);
      }
      self.ports.send("response", new_ip);

      Ok(())
  }
}
