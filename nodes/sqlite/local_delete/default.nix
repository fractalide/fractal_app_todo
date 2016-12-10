{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; with edges; ''
  db_path => db_path delete(${sqlite_delete})
  '${generic_text}:(text="todos")' -> option delete()
  delete => delete delete()
  delete() response => response
  '';
}
