{ stdenv, buildFractalideSubnet, upkeepers
  , add_req_id
  , build_json
  , build_response
  , get_id
  , ip_clone
  , local_get
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   db_path => db_path get_sql()
   input => input id(${get_id}) id -> get get_sql(${local_get})
   get_sql() id -> id build_json(${build_json})
   get_sql() response -> todo build_json()

   id() req_id -> id add_req_id(${add_req_id})

   build_json() json -> playload build_resp(${build_response})
   get_sql() error -> error build_resp()

   build_resp() response -> response add_req_id() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
