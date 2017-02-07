{ subgraph, imsgs, nodes, edges }:

subgraph {
  src = ./.;
  flowscript = with nodes; ''
  input => input todo_get_todo(${todo_get_todo})
  db_path => db_path patch_sql()

  todo_get_todo() id -> get get_sql(${sqlite_local_get})

  synch(${todo_patch_synch})

  get_sql() response -> todo synch() todo -> old merge(${todo_patch_json})
  todo_get_todo() raw_todo -> raw_todo synch() raw_todo -> new merge()

  get_sql() id -> id synch() id -> id patch_sql(${sqlite_local_patch})
  merge() todo -> msg patch_sql()

  patch_sql() response -> playload build_resp(${todo_build_response})
  get_sql() error -> error synch() error -> error build_resp()

  todo_get_todo() req_id -> id todo_add_req_id(${todo_add_req_id})
  build_resp() response -> response todo_add_req_id() response => response
   '';
}
