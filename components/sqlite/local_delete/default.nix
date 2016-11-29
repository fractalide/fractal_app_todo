{ subnet, components, contracts }:

subnet {
  src = ./.;
  flowscript = with components; with contracts; ''
  db_path => db_path delete(${sqlite_delete})
  '${generic_text}:(text="todos")' -> option delete()
  delete => delete delete()
  delete() response => response
  '';
}
