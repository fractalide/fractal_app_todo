#![feature(question_mark)]
#[macro_use]
extern crate rustfbp;
extern crate capnp;

pub struct Save {
    todo: Option<IP>,
    raw_todo: Option<IP>,
}

impl Save {
    pub fn new() -> Save {
        Save {
            todo: None,
            raw_todo: None
        }
    }
}

agent! {
    ip_clone,
    inputs(error: any, id: any, todo: any, raw_todo: any),
    inputs_array(),
    outputs(error: any, id: any, todo: any, raw_todo: any),
    outputs_array(),
    option(),
    acc(), portal(Save => Save::new())
    fn run(&mut self) -> Result<()> {
        if let Ok(ip) = self.ports.try_recv("error") {
            self.ports.send("error", ip)?;
            if let Some(ip) = self.portal.raw_todo.take() {
               // We drop the ip
            } else {
                // We didn't receive yet the raw_todo
                let _ = self.ports.recv("raw_todo")?;
            }
        }
        else if let Ok(ip) = self.ports.try_recv("id") {
            self.ports.send("id", ip);
            let raw = if let Some(ip) = self.portal.raw_todo.take() {
                ip
            } else {
                self.ports.recv("raw_todo")?
            };
            self.ports.send("raw_todo", raw)?;
            let todo = if let Some(ip) = self.portal.todo.take() {
                ip
            } else {
                self.ports.recv("todo")?
            };
            self.ports.send("todo", todo)?;
        } else if let Ok(ip) = self.ports.try_recv("raw_todo") {
            self.portal.raw_todo = Some(ip);
        } else if let Ok(ip) = self.ports.try_recv("todo") {
            self.portal.todo = Some(ip);
        }

        Ok(())
    }
}
