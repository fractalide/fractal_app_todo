{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_u64 prim_text net_http_edges.response ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
