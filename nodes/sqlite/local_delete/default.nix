{ subgraph, imsgs, nodes, edges }:

subgraph rec {
  src = ./.;
  imsg = imsgs {
    edges = with edges; [ PrimText ];
  };
  flowscript = with nodes; ''
  db_path => db_path delete(${sqlite_delete})
  '${imsg}.PrimText:(text="todos")' -> option delete()
  delete => delete delete()
  delete() response => response
  '';
}
