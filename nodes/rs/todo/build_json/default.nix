{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  capnp_edges = with edges.capnp; [ PrimText PrimU64 AppTodo ];
  mods = with mods.rs; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
