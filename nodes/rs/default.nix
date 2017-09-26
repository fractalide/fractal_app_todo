{ buffet }:

# Please refer to section 2.6 namely Evolution of Public Contracts
# of the Collective Code Construction Contract in CONTRIBUTING.md
let
  callPackage = buffet.pkgs.lib.callPackageWith ( buffet.pkgs // buffet.support.node.rs // buffet.support // buffet );
in
{
  # RAW NODES
  # -   raw nodes are incomplete and immature, they may wink into and out of existance
  # -   use at own risk, anything in this section can change at any time.

  todo_add_req_id = callPackage ./todo/add_req_id {};
  todo_build_json = callPackage ./todo/build_json {};
  todo_build_response = callPackage ./todo/build_response {};
  todo_delete = callPackage ./todo/delete {};
  todo_get = callPackage ./todo/get {};
  todo_get_id = callPackage ./todo/get_id {};
  todo_get_todo = callPackage ./todo/get_todo {};
  sqlite_local_get = callPackage ./sqlite/local_get {};
  sqlite_local_delete = callPackage ./sqlite/local_delete {};
  sqlite_local_patch = callPackage ./sqlite/local_patch {};
  sqlite_local_insert = callPackage ./sqlite/local_insert {};
  todo_patch = callPackage ./todo/patch {};
  todo_patch_json = callPackage ./todo/patch_json {};
  todo_patch_synch = callPackage ./todo/patch_synch {};
  todo_post = callPackage ./todo/post {};
  sqlite_get = callPackage ./sqlite/get {};
  sqlite_delete = callPackage ./sqlite/delete {};
  sqlite_patch = callPackage ./sqlite/patch {};
  sqlite_insert = callPackage ./sqlite/insert {};

  # DRAFT NODES
  # -   draft nodes change a lot in tandom with other nodes in their subgraph
  # -   there will be change in these nodes and few people are using these nodes so expect breakage

  # STABLE NODES
  # -   stable nodes do not change names of ports, agents nor subgraphs,
  # -   you may add new port names, but never change, nor remove port names

  # DEPRECATED NODES
  # -   deprecated nodes do not change names of ports, agents nor subgraphs.
  # -   keep the implementation functioning, print a warning message and tell users to use replacement node

  # LEGACY NODES
  # -   legacy nodes do not change names of ports, agents nor subgraphs.
  # -   assert and remove implementation of the node.
}
