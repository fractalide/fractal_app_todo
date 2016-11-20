{ stdenv, buildFractalideSubnet, upkeepers
  , todo_add_req_id
  , todo_build_json
  , todo_build_response
  , todo_get_todo
  , ip_clone
  , sqlite_local_insert
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   db_path => db_path insert_todo()
   input => input todo_get_todo(${todo_get_todo}) todo -> input cl_todo(${ip_clone})
   cl_todo() clone[0] -> insert insert_todo(${sqlite_local_insert})
   cl_todo() clone[1] -> todo todo_build_json(${todo_build_json})
   insert_todo() response -> id todo_build_json()

   todo_get_todo() req_id -> id todo_add_req_id(${todo_add_req_id})
   todo_build_json() json -> playload todo_build_response(${todo_build_response})
   todo_build_response() response -> response todo_add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
