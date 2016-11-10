{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , path
  , sqlite_insert
  , ...}:
   buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
    '${path}:(path="${builtins.getEnv "HOME"}/todos.db")' -> connect insert(${sqlite_insert})
    '${generic_text}:(text="todos")' -> option insert()

    insert => insert insert()
    insert() response => response

   '';

   meta = with stdenv.lib; {
    description = "Subnet: Counter app";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/development/test;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
