{ subgraph, imsgs, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; ''
  db_path => db_path insert_todo()
  input => input todo_get_todo(${todo_get_todo}) todo -> input cl_todo(${msg_clone})
  cl_todo() clone[0] -> insert insert_todo(${sqlite_local_insert})
  cl_todo() clone[1] -> todo todo_build_json(${todo_build_json})
  insert_todo() response -> id todo_build_json()

  todo_get_todo() req_id -> id todo_add_req_id(${todo_add_req_id})
  todo_build_json() json -> playload todo_build_response(${todo_build_response})
  todo_build_response() response -> response todo_add_req_id() response => response
   '';
}
