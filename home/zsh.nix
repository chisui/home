{ config, pkgs, ... }:
let
  agnoster-nix-theme = builtins.fetchurl {
    url = "https://gist.githubusercontent.com/chisui/0d12bd51a5fd8e6bb52e6e6a43d31d5e/raw/f54d848ba646ba141ec01e19095144d34f326b55/agnoster-nix.zsh-theme";
    sha256 = "0phkksni37n8jml3hcgkzwihqbpwya6s9bzqy2a9v418sh8ls3sk";
  };
  customDir = pkgs.stdenv.mkDerivation {
    name = "oh-my-zsh-custom-dir";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${agnoster-nix-theme} $out/themes/agnoster-nix.zsh-theme  
    '';
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.1.0";
          sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster-nix";
      custom = "${customDir}";
    };
  };
}
