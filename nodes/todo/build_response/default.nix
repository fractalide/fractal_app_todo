{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_u64 generic_text net_http_edges.response ];
  crates = with crates; [ rustfbp capnp ];
  osdeps = with pkgs; [];
}
