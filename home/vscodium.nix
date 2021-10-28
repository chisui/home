{ config, pkgs, ... }:
let
  ext-pegjs = pkgs.stdenv.mkDerivation {
    name = "vscode-ext-pegjs-lang";
    src = pkgs.fetchgit {
      url = "https://github.com/SrTobi/code-pegjs-language.git";
      rev = "2bf85d6414b5c9607d50335ede567f7505e9fe23";
      sha256 = "0m7ayc9kbk9yyrq341kai3vk20jrzwq900n1ifxy8s2w0y5qwbdx";
    };
    installPhase = ''
      mkdir -p $out/share/vscode/extensions/pegjs-language
      cp -r $src/* $out/share/vscode/extensions/pegjs-language
    '';
  };

  console-theme = import ./solarized-dark.nix;
  
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "rust-client.disableRustup" = true;
      "rust-analyzer.server.path" = "rust-analyzer";
      "workbench.editor.untitled.hint" = "hidden";
      "terminal.integrated.fontFamily" = console-theme.font.family;
      "workbench.startupEditor" = "none";
      "workbench.editor.enablePreview" = false;
      "workbench.commandPalette.history" = 0;
      "task.quickOpen.history" = 0;
      "workbench.colorCustomizations" = with console-theme.color; {
        "terminal.background" = background;

        "terminal.ansiBlack"   = black;
        "terminal.ansiRed"     = red;
        "terminal.ansiGreen"   = green;
        "terminal.ansiYellow"  = yellow;
        "terminal.ansiBlue"    = blue;
        "terminal.ansiMagenta" = magenta;
        "terminal.ansiCyan"    = cyan;
        "terminal.ansiWhite"   = white;
        "terminal.ansiBrightBlack"   = brightBlack;
        "terminal.ansiBrightRed"     = brightRed;
        "terminal.ansiBrightGreen"   = brightGreen;
        "terminal.ansiBrightYellow"  = brightYellow;
        "terminal.ansiBrightBlue"    = brightBlue;
        "terminal.ansiBrightMagenta" = brightMagenta;
        "terminal.ansiBrightCyan"    = brightCyan;
        "terminal.ansiBrightWhite"   = brightWhite;
      };
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
    };
    extensions = [
      ext-pegjs
    ];
  };
}
