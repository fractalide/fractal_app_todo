{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , path
  , sqlite_get
  , ...}:
   buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
    db_path => db_path get(${sqlite_get})
    '${generic_text}:(text="todos")' -> option get()

    get => get get()
    get() response => response
    get() error => error
    get() id => id
   '';

   meta = with stdenv.lib; {
    description = "Subnet: Counter app";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/development/test;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
