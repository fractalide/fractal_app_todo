{ pkgs, support, allContracts, allComponents, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // support // allContracts // allComponents);
self = rec { # use one line only to insert a component (utils/new_component.py sorts this list)
  sqlite_get = callPackage ./sqlite/get {};
  sqlite_insert = callPackage ./sqlite/insert {};
}; # use one line only to insert a component (utils/new_component.py sorts this list)
in
self
