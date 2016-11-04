{stdenv, buildFractalideContract, upkeepers, ...}:

buildFractalideContract rec {
  src = ./.;
  contract = ''
  @0xf86dbcdb5a095c92;

  struct Todo {
    id @0 :UInt64;
    title @1 :Text;
    order @2 :UInt64;
    completed @3 :bool;
    url @4 :Text;
  }
  '';

  meta = with stdenv.lib; {
    description = "Contract: Describes a simple boolean data type";
    homepage = https://github.com/fractalide/fractalide/tree/master/contracts/maths/boolean;
    license = with licenses; [ mpl20 ];
    maintainers = with upkeepers; [ dmichiels sjmackenzie];
  };
}
