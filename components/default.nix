{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  todo_build_json = callPackage ./todo/build_json {};
  todo_build_response = callPackage ./todo/build_response {};
  todo_patch_json = callPackage ./todo/patch_json {};
  local_get = callPackage ./sqlite/local_get {};
  local_delete = callPackage ./sqlite/local_delete {};
  local_patch = callPackage ./sqlite/local_patch {};
  local_insert = callPackage ./sqlite/local_insert {};
  sqlite_get = callPackage ./sqlite/get {};
  sqlite_delete = callPackage ./sqlite/delete {};
  sqlite_patch = callPackage ./sqlite/patch {};
  sqlite_insert = callPackage ./sqlite/insert {};
  todo_get_id = callPackage ./todo/get_id {};
  todo_get_todo = callPackage ./todo/get_todo {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
