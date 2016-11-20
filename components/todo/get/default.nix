{ stdenv, buildFractalideSubnet, upkeepers
  , todo_add_req_id
  , todo_build_json
  , todo_build_response
  , todo_get_id
  , ip_clone
  , sqlite_local_get
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   db_path => db_path get_sql()
   input => input id(${todo_get_id}) id -> get get_sql(${sqlite_local_get})
   get_sql() id -> id todo_build_json(${todo_build_json})
   get_sql() response -> todo todo_build_json()

   id() req_id -> id todo_add_req_id(${todo_add_req_id})

   todo_build_json() json -> playload build_resp(${todo_build_response})
   get_sql() error -> error build_resp()

   build_resp() response -> response todo_add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
