{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ PrimText FsPath ];
  mods = with mods.rs; [ rustfbp capnp rusqlite ];
  osdeps = with pkgs; [  ];
}
