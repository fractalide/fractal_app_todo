{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text net_http_edges.request generic_u64 todo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
