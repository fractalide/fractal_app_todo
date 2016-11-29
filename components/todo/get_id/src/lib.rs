#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

component! {
  todo_get_id, contracts(generic_text, request, generic_u64)
  inputs(input: request),
  inputs_array(),
  outputs(req_id: generic_u64, id: generic_text),
  outputs_array(),
  option(),
  acc(),
  fn run(&mut self) -> Result<()> {
      let mut ip = self.ports.recv("input")?;
      let reader: request::Reader = ip.read_contract()?;

      let mut new_ip = IP::new();
      {
          let mut builder: generic_text::Builder = new_ip.build_contract();
          let url = reader.get_url()?;
          if let Some(ref id) = url.split("/").last() {
              builder.set_text(id);
          }
      }
      self.ports.send("id", new_ip);

      let mut new_ip = IP::new();
      {
          let mut builder: generic_u64::Builder = new_ip.build_contract();
          builder.set_number(reader.get_id());
      }
      self.ports.send("req_id", new_ip);
      Ok(())
  }
}
