{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  local_get = callPackage ./sqlite/local_get {};
  local_delete = callPackage ./sqlite/local_delete {};
  local_patch = callPackage ./sqlite/local_patch {};
  local_insert = callPackage ./sqlite/local_insert {};
  sqlite_get = callPackage ./sqlite/get {};
  sqlite_delete = callPackage ./sqlite/delete {};
  sqlite_patch = callPackage ./sqlite/patch {};
  sqlite_insert = callPackage ./sqlite/insert {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
