{ subgraph, imsgs, nodes, edges }:

subgraph rec {
  src = ./.;
  imsg = imsgs {
    edges = with edges; [ PrimText ];
  };
  flowscript = with nodes; ''
  db_path => db_path insert(${sqlite_insert})
  '${imsg}.PrimText:(text="todos")' -> option insert()
  insert => insert insert()
  insert() response => response
  '';
}
