{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
  @0xf86dbcdb5a095c92;

  struct AppTodo {
    id @0 :UInt64;
    title @1 :Text;
    order @2 :UInt64;
    completed @3 :Bool;
  }
  '';
}
