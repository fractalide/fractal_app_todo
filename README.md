# app_todo_backend

## Project Description:

implement a backend http server to save "todo".
You must have the sql database in "~/todos.db". A fresh version of it is here: https://gitlab.com/dmichiels/todos_db

### Project Problem:

... <clear problem description, the cause for this project>
### Solution:

... <describe solution your project has taken>
### Stability:

Choose one:
[Experimental, Stable, Legacy, Deprecate]

### Build Instructions
Make sure you have installed [nix](https://nixos.org/nix) installed, most likely your package manage has `nix` available, if not you'll need to compile from source.
```
$ NIX_PATH="nixpkgs=https://github.com/NixOS/nixpkgs/archive/125ffff089b6bd360c82cf986d8cc9b17fc2e8ac.tar.gz:fractalide=https://github.com/fractalide/fractalide/archive/master.tar.gz"
$ git clone git@github.com:fractalide/frac_workbench.git
$ cd frac_workbench
$ nix-build
```
