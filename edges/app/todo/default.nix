{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    struct AppTodo {
      id @0 :UInt64;
      title @1 :Text;
      order @2 :UInt64;
      completed @3 :Bool;
    }
  '';
}
