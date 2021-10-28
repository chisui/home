{ pkgs, ... }:
{
  "java.configuration.runtimes" = pkgs.lib.mapAttrsToList (n: v: {
    name = "OpenJDK ${n}";
    path = pkgs."jdk${builtins.toString v}".home;
  }) {
    "8"      = 8;
    "11"     = 11;
    "lts"    = 11;
    "17"     = 17;
    "newest" = 17;
  };
}
