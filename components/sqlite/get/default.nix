{ stdenv
  , buildFractalideComponent
  , genName, upkeepers
  , generic_text
  , path
# 3th party
  , sqlite
  , pkgconfig
  , ...}:

buildFractalideComponent rec {
  name = genName ./.;
  src = ./.;
  contracts = [ generic_text path ];
  buildInputs = [ sqlite pkgconfig ];
  depsSha256 = "1j1nxh3vr1nlaz2ayyn689q5lj76w4nwx885wwg4jwflpry8fak2";

  meta = with stdenv.lib; {
    description = "Component: NAND logic gate";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
