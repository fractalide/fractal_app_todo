{ component, contracts, crates, pkgs }:

component {
  src = ./.;
  contracts = with contracts; [ generic_u64 generic_text net_http_contracts.response ];
  crates = with crates; [];
  osdeps = with pkgs; [];
  depsSha256 = "0pzvnvhmzv1bbp5gfgmak3bsizhszw4bal0vaz30xmmd5yx5ciqj";
}
