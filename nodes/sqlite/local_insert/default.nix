{ subgraph, imsg, nodes, edges }:
let
  PrimText = imsg {
    class = edges.PrimText;
    text = ''(text="todos")'';
  };
in
subgraph {
  src = ./.;
  flowscript = with nodes; ''
  db_path => db_path insert(${sqlite_insert})
  '${PrimText}' -> option insert()
  insert => insert insert()
  insert() response => response
  '';
}
