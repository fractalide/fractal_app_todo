{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , generic_text
  , generic_u64
  , net_http_contracts
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ generic_u64 generic_text net_http_contracts.response ];
  depsSha256 = "06l4m7ividn2d99b5yrhs51ix4810f0rjyv9iird13rzk2qg2g8q";

  meta = with stdenv.lib; {
    description = "Component: build a response from a text option";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
