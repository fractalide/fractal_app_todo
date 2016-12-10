{ buffet }:
let
  callPackage = buffet.pkgs.lib.callPackageWith ( buffet.support // buffet );
in
rec {
  todo = callPackage ./todo {};
  workbench_boolean = callPackage ./workbench/boolean {};
}
