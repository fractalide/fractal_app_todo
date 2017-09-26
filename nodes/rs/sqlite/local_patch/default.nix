{ subgraph, imsg, nodes, edges }:
let
  PrimText = imsg {
    class = edges.capnp.PrimText;
    text = ''(text="todos")'';
  };
in
subgraph {
  src = ./.;
  flowscript = with nodes.rs; ''
    db_path => db_path patch(${sqlite_patch})
    '${PrimText}' -> option patch()
    msg => msg patch()
    id => id patch()
    patch() response => response
  '';
}
