{ contract, contracts }:

contract {
  src = ./.;
  importedContracts = with contracts; [ ];
  schema = with contracts; ''
  @0xf86dbcdb5a095c92;

  struct Todo {
    id @0 :UInt64;
    title @1 :Text;
    order @2 :UInt64;
    completed @3 :Bool;
  }
  '';
}
