{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText PrimU64 AppTodo ];
  mods = with mods.rs; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
