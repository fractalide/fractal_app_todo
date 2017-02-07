{ subgraph, imsgs, nodes, edges }:

subgraph rec {
  src = ./.;
  imsg = imsgs {
    edges = with edges; [ PrimText ];
  };
  flowscript = with nodes; with edges; ''
    db_path => db_path patch(${sqlite_patch})
    '${imsg}.PrimText:(text="todos")' -> option patch()
    msg => msg patch()
    id => id patch()
    patch() response => response
  '';
}
