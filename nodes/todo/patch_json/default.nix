{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text todo ];
  crates = with crates; [];
  osdeps = with pkgs; [];
  depsSha256 = "13dp69bcradl5ggvfi3hk07wnbhg51d9d0l1f3ykhs6v7fcx17ma";
}
