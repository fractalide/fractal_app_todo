{ component, contracts, crates, pkgs }:

component {
  src = ./.;
  contracts = with contracts; [ generic_text net_http_contracts.request generic_u64 todo ];
  crates = with crates; [];
  osdeps = with pkgs; [];
  depsSha256 = "13dp69bcradl5ggvfi3hk07wnbhg51d9d0l1f3ykhs6v7fcx17ma";
}
