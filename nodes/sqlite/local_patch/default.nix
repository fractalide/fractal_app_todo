{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  edges = with edges; [ generic_text ];
  flowscript = with nodes; with edges; ''
    db_path => db_path patch(${sqlite_patch})
    '${generic_text}:(text="todos")' -> option patch()
    msg => msg patch()
    id => id patch()
    patch() response => response
  '';
}
