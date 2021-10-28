{ pkgs, ... }:
let
  jdk = n: v: {
    name = "OpenJDK ${n}";
    path = pkgs."jdk${builtins.toString v}".home;
  };
in {
  "java.configuration.runtimes" = [
    (jdk "8"      8)
    (jdk "11"     11)
    (jdk "lts"    11 // { default = true; })
    (jdk "17"     17)
    (jdk "newest" 17)
  ];
}
