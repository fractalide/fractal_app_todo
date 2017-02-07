{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText AppTodo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
