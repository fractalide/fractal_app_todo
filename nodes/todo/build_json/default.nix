{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText PrimU64 AppTodo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
