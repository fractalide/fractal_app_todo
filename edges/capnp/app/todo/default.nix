{ edge, edges }:

edge.capnp {
  src = ./.;
  edges =  with edges.capnp; [];
  schema = with edges.capnp; ''
    struct AppTodo {
      id @0 :UInt64;
      title @1 :Text;
      order @2 :UInt64;
      completed @3 :Bool;
    }
  '';
}
