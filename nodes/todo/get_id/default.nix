{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text net_http_edges.net_http_request prim_u64 ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
