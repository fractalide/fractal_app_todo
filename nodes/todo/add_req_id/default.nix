{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_u64 generic_text net_http_edges.response ];
  crates = with crates; [];
  osdeps = with pkgs; [];
  depsSha256 = "0pzvnvhmzv1bbp5gfgmak3bsizhszw4bal0vaz30xmmd5yx5ciqj";
}
