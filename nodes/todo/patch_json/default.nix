{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text todo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
