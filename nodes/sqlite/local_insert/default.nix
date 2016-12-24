{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  edges = with edges; [ generic_text ];
  flowscript = with nodes; with edges; ''
  db_path => db_path insert(${sqlite_insert})
  '${generic_text}:(text="todos")' -> option insert()
  insert => insert insert()
  insert() response => response
  '';
}
