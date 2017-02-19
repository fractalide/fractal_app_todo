{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimU64 PrimText NetHttpEdges.NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
