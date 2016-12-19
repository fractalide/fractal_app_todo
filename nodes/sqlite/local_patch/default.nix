{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; with edges; ''
    db_path => db_path patch(${sqlite_patch})
    '${generic_text}:(text="todos")' -> option patch()
    msg => ip patch()
    id => id patch()
    patch() response => response
  '';
}
