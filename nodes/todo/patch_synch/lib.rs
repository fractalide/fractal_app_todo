#[macro_use]
extern crate rustfbp;
extern crate capnp;

pub struct Save {
    todo: Option<Msg>,
    raw_todo: Option<Msg>,
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
    input(error: any, id: any, todo: any, raw_todo: any),
    output(error: any, id: any, todo: any, raw_todo: any),
    portal(Save => Save::new()),
    fn run(&mut self) -> Result<Signal> {
        if let Ok(msg) = self.input.error.try_recv() {
            self.output.error.send(msg)?;
            if let Some(msg) = self.portal.raw_todo.take() {
               // We drop the msg
            } else {
                // We didn't receive yet the raw_todo
                let _ = self.input.raw_todo.recv()?;
            }
        }
        else if let Ok(msg) = self.input.id.try_recv() {
            self.output.id.send(msg);
            let raw = if let Some(msg) = self.portal.raw_todo.take() {
                msg
            } else {
                self.input.raw_todo.recv()?
            };
            self.output.raw_todo.send(raw)?;
            let todo = if let Some(msg) = self.portal.todo.take() {
                msg
            } else {
                self.input.todo.recv()?
            };
            self.output.todo.send(todo)?;
        } else if let Ok(msg) = self.input.raw_todo.try_recv() {
            self.portal.raw_todo = Some(msg);
        } else if let Ok(msg) = self.input.todo.try_recv() {
            self.portal.todo = Some(msg);
        }
        Ok(End)
    }
}
