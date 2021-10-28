{ pkgs, ... }:
let
  pegjs = pkgs.stdenv.mkDerivation {
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
in {
  extensions = [ pegjs ];
}
