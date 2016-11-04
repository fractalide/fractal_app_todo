{ pkgs, support, allContracts, ... }:
let
callPackage = pkgs.lib.callPackageWith (pkgs // allContracts // support);
in
rec {
  todo = callPackage ./todo {};
  workbench_boolean = callPackage ./workbench/boolean {};
}
