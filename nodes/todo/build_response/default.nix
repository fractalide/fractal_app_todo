{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimU64 PrimText NetHttpEdges.NetHttpResponse ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
