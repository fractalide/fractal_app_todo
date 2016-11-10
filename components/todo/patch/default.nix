{ stdenv, buildFractalideSubnet, upkeepers
  , build_response
  , get_todo
  , ip_clone
  , local_get
  , local_patch
  , patch_json
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input get_todo(${get_todo})

   get_todo() id -> input clone_id(${ip_clone})
   clone_id() clone[0] -> get get_sql(${local_get})
   get_sql() response -> old merge(${patch_json})
   get_todo() raw_todo -> new merge()

   clone_id() clone[1] -> id patch_sql(${local_patch})
   merge() todo -> ip patch_sql()

   patch_sql() response -> playload build_resp(${build_response})
   get_todo() req_id -> id build_resp()
   build_resp() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
