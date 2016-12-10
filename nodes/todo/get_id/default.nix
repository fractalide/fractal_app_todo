{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text net_http_edges.request generic_u64 ];
  crates = with crates; [];
  osdeps = with pkgs; [];
  depsSha256 = "0pzvnvhmzv1bbp5gfgmak3bsizhszw4bal0vaz30xmmd5yx5ciqj";
}
