{ agent, edges, mods, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ PrimText AppTodo ];
  mods = with mods.rs; [ rustfbp capnp json ];
  osdeps = with pkgs; [];
}
