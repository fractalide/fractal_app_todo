{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ PrimU64 PrimText NetHttpEdges.NetHttpResponse ];
  mods = with mods.rs; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
