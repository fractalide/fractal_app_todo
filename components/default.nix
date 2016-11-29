{ buffet }:

let
callPackage = buffet.pkgs.lib.callPackageWith (buffet // buffet.support );
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
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
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
