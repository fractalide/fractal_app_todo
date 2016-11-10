{ stdenv, buildFractalideSubnet, upkeepers
  , build_json
  , build_response
  , get_id
  , local_delete
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input id(${get_id})
   id() id -> delete delete_sql(${local_delete})
   delete_sql() response -> playload build_resp(${build_response})
   id() req_id -> id build_resp()
   build_resp() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
