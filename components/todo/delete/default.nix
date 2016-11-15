{ stdenv, buildFractalideSubnet, upkeepers
  , add_req_id
  , build_json
  , build_response
  , get_id
  , local_delete
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input id(${get_id})
   db_path => db_path delete_sql()
   id() id -> delete delete_sql(${local_delete})
   delete_sql() response -> playload build_resp(${build_response})
   id() req_id -> id add_req_id(${add_req_id})
   build_resp() response -> response add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
