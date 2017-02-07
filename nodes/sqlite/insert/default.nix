{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText FsPath ];
  crates = with crates; [ rustfbp capnp rusqlite ];
  osdeps = with pkgs; [ sqlite pkgconfig ];
}
