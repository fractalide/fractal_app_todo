{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; with edges; ''
  db_path => db_path get(${sqlite_get})
  '${prim_text}:(text="todos")' -> option get()
  get => get get()
  get() response => response
  get() error => error
  get() id => id
  '';
}
