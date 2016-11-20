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
  depsSha256 = "05398m69cq1pb4463h2pdmjz09f83fn3bxq5l6r1azaig933ybqq";

  meta = with stdenv.lib; {
    description = "Component: NAND logic gate";
    homepage = https://github.com/fractalide/fractalide/tree/master/components/maths/boolean/nand;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
