{ pkgs, ... }:
let
  jdk = n: v: {
    name = "JavaSE-${n}";
    path = pkgs."jdk${builtins.toString v}".home;
  };
in {
  extensions = [
    pkgs.vscode-extensions.redhat.java
  ];
  settings = {
    "java.configuration.runtimes" = [
      (jdk "1.8"    8)
      (jdk "11"     11 // { default = true; })
      (jdk "17"     17)
    ];
  };
}
