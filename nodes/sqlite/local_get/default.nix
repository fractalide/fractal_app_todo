{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  edges = with edges; [ generic_text ];
  flowscript = with nodes; with edges; ''
  db_path => db_path get(${sqlite_get})
  '${generic_text}:(text="todos")' -> option get()
  get => get get()
  get() response => response
  get() error => error
  get() id => id
  '';
}