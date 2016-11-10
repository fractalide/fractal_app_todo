{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  add_req_id = callPackage ./todo/add_req_id {};
  build_json = callPackage ./todo/build_json {};
  build_response = callPackage ./todo/build_response {};
  delete = callPackage ./todo/delete {};
  get = callPackage ./todo/get {};
  get_id = callPackage ./todo/get_id {};
  get_todo = callPackage ./todo/get_todo {};
  local_get = callPackage ./sqlite/local_get {};
  local_delete = callPackage ./sqlite/local_delete {};
  local_patch = callPackage ./sqlite/local_patch {};
  local_insert = callPackage ./sqlite/local_insert {};
  patch = callPackage ./todo/patch {};
  patch_json = callPackage ./todo/patch_json {};
  patch_synch = callPackage ./todo/patch_synch {};
  post = callPackage ./todo/post {};
  sqlite_get = callPackage ./sqlite/get {};
  sqlite_delete = callPackage ./sqlite/delete {};
  sqlite_patch = callPackage ./sqlite/patch {};
  sqlite_insert = callPackage ./sqlite/insert {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
