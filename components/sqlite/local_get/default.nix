{ subnet, components, contracts }:

subnet {
  src = ./.;
  flowscript = with components; with contracts; ''
  db_path => db_path get(${sqlite_get})
  '${generic_text}:(text="todos")' -> option get()
  get => get get()
  get() response => response
  get() error => error
  get() id => id
  '';
}
