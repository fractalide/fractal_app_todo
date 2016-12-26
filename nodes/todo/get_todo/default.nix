{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text net_http_edges.request prim_u64 todo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
