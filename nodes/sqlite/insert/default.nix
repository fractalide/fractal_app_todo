{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text path ];
  crates = with crates; [ rustfbp capnp rusqlite ];
  osdeps = with pkgs; [ sqlite pkgconfig ];
}
