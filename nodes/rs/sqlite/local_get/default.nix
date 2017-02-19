{ subgraph, imsg, nodes, edges }:
let
  PrimText = imsg {
    class = edges.PrimText;
    text = ''(text="todos")'';
  };
in
subgraph {
  src = ./.;
  flowscript = with nodes.rs; ''
  db_path => db_path get(${sqlite_get})
  '${PrimText}' -> option get()
  get => get get()
  get() response => response
  get() error => error
  get() id => id
  '';
}
