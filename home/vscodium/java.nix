{ pkgs, ... }:
let
  jdk = { version, name ? builtins.toString version, ... }: {
    name = "JavaSE-${name}";
    path = pkgs."jdk${builtins.toString version}".home;
  };
in
{
  extensions = [
    pkgs.vscode-extensions.redhat.java
  ];
  settings = {
    "java.configuration.runtimes" = [
      (jdk { version = 8; name = "1.8"; })
      (jdk { version = 11; default = true; })
      # (jdk { version = 14; })
      # (jdk { version = 15; })
      # (jdk { version = 16; })
      (jdk { version = 17; })
    ];
  };
}
