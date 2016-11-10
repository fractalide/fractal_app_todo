#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  todo_get_id, contracts(generic_u64, response)
  inputs(id: generic_u64, response: response),
  inputs_array(),
  outputs(response: response),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut ip = self.ports.recv("id")?;
      let reader: generic_u64::Reader = ip.get_root()?;

      let mut ip_pl = self.ports.recv("response")?;
      {
          let mut builder = ip_pl.init_root_from_reader::<response::Builder, response::Reader>()?;
          builder.set_id(reader.get_number());
      }
      self.ports.send("response", ip_pl);

      Ok(())
  }
}
