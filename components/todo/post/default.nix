{ stdenv, buildFractalideSubnet, upkeepers
  , build_json
  , build_response
  , get_todo
  , ip_clone
  , local_insert
  ,...}:

  buildFractalideSubnet rec {
   src = ./.;
   subnet = ''

   input => input get_todo(${get_todo}) todo -> input cl_todo(${ip_clone})
   cl_todo() clone[0] -> insert insert_todo(${local_insert})
   cl_todo() clone[1] -> todo build_json(${build_json})
   insert_todo() response -> id build_json()

   get_todo() req_id -> id build_response(${build_response})
   build_json() json -> playload build_response()
   build_response() response => response
     '';

   meta = with stdenv.lib; {
    description = "Subnet: testing file for http server";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/test/sjm;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}