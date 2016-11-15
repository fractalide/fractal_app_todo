{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , path
  , sqlite_delete
  , ...}:
   buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
    db_path => db_path delete(${sqlite_delete})
    '${generic_text}:(text="todos")' -> option delete()

    delete => delete delete()
    delete() response => response

   '';

   meta = with stdenv.lib; {
    description = "Subnet: Counter app";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/development/test;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
