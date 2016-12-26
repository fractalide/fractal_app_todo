{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text fs_path ];
  crates = with crates; [ rustfbp capnp rusqlite ];
  osdeps = with pkgs; [ sqlite pkgconfig ];
}
