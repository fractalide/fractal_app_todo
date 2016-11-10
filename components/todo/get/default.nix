{ stdenv, buildFractalideSubnet, upkeepers
  , build_json
  , build_response
  , get_id
  , ip_clone
  , local_get
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''
   input => input id(${get_id}) id -> input cl_id(${ip_clone})
   cl_id() clone[0] -> get get_sql(${local_get})
   cl_id() clone[1] -> id build_json(${build_json})
   get_sql() response -> todo build_json()

   id() req_id -> id build_resp(${build_response})
   build_json() json -> playload build_resp()
   build_resp() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
