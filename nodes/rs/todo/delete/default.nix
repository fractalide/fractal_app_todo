{ subgraph, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes.rs; ''
  input => input id(${todo_get_id})
  db_path => db_path delete_sql()
  id() id -> delete delete_sql(${sqlite_local_delete})
  delete_sql() response -> playload build_resp(${todo_build_response})
  id() req_id -> id todo_add_req_id(${todo_add_req_id})
  build_resp() response -> response todo_add_req_id() response => response
   '';
}
