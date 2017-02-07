{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText NetHttpEdges.NetHttpRequest PrimU64 ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
