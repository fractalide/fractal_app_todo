{ subnet, components, contracts }:

subnet {
  src = ./.;
  flowscript = with components; with contracts; ''
  db_path => db_path insert(${sqlite_insert})
  '${generic_text}:(text="todos")' -> option insert()
  insert => insert insert()
  insert() response => response
  '';
}
