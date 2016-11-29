{ subnet, components, contracts }:

subnet {
  src = ./.;
  flowscript = with components; with contracts; ''
  db_path => db_path patch(${sqlite_patch})
  '${generic_text}:(text="todos")' -> option patch()
  ip => ip patch()
  id => id patch()
  patch() response => response
  '';
}
