{ stdenv, buildFractalideSubnet, upkeepers
  , add_req_id
  , build_response
  , get_todo
  , ip_clone
  , local_get
  , local_patch
  , patch_json
  , patch_synch
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input get_todo(${get_todo})
   db_path => db_path patch_sql()

   get_todo() id -> get get_sql(${local_get})

   synch(${patch_synch})

   get_sql() response -> todo synch() todo -> old merge(${patch_json})
   get_todo() raw_todo -> raw_todo synch() raw_todo -> new merge()

   get_sql() id -> id synch() id -> id patch_sql(${local_patch})
   merge() todo -> ip patch_sql()

   patch_sql() response -> playload build_resp(${build_response})
   get_sql() error -> error synch() error -> error build_resp()

   get_todo() req_id -> id add_req_id(${add_req_id})
   build_resp() response -> response add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
