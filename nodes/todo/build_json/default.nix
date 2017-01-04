{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ prim_text prim_u64 app_todo ];
  crates = with crates; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
