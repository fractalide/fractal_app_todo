{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText NetHttpEdges.NetHttpRequest PrimU64 AppTodo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
