{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText FsPath ];
  mods = with mods.rs; [ rustfbp capnp rusqlite ];
  osdeps = with pkgs; [ sqlite pkgconfig ];
}
