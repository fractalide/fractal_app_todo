{ subgraph, imsgs, nodes, edges }:

subgraph rec {
  src = ./.;
  imsg = imsgs {
    edges = with edges; [ PrimText ];
  };
  flowscript = with nodes; ''
  db_path => db_path get(${sqlite_get})
  '${imsg}.PrimText:(text="todos")' -> option get()
  get => get get()
  get() response => response
  get() error => error
  get() id => id
  '';
}
