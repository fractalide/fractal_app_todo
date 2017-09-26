{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ PrimText AppTodo ];
  mods = with mods.rs; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
