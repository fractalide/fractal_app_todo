{ stdenv, buildFractalideSubnet, upkeepers
  , todo_add_req_id
  , todo_build_response
  , todo_get_id
  , sqlite_local_delete
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input id(${todo_get_id})
   db_path => db_path delete_sql()
   id() id -> delete delete_sql(${sqlite_local_delete})
   delete_sql() response -> playload build_resp(${todo_build_response})
   id() req_id -> id todo_add_req_id(${todo_add_req_id})
   build_resp() response -> response todo_add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
