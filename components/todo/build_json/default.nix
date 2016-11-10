{ stdenv, openssl
  , buildFractalideComponent
  , genName, upkeepers
  , generic_text
  , generic_u64
  , todo
  , net_http_contracts
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ generic_text net_http_contracts.request generic_u64 todo ];
  depsSha256 = "1cndzxjqnl370c2iw71cxljvn6gb2kb405j74j7zap84ii2f0xjy";

  meta = with stdenv.lib; {
    description = "Component: build a response from a text option";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}