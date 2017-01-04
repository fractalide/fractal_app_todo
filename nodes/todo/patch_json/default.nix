{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text app_todo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
