{ stdenv, buildFractalideSubnet, upkeepers
  , generic_text
  , path
  , sqlite_patch
  , ...}:
   buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
    '${path}:(path="/home/denis/test.db")' -> connect patch(${sqlite_patch})
    '${generic_text}:(text="todos")' -> option patch()

    ip => ip patch()
    id => id patch()
    patch() response => response

   '';

   meta = with stdenv.lib; {
    description = "Subnet: Counter app";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/development/test;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
