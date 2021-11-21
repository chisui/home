{ config, pkgs, ... }:
let
  agnoster-nix-theme = builtins.fetchurl {
    url = "https://gist.githubusercontent.com/chisui/0d12bd51a5fd8e6bb52e6e6a43d31d5e/raw/a97b74ce17c5f1befabe266ccf02a972cab2911b/agnoster-nix.zsh-theme";
    sha256 = "1m7qqrp8z0glnq81c9ldzmm0r42rgdmw8nk9hvssbjphx5khk6z7";
  };
  customDir = pkgs.stdenv.mkDerivation {
    name = "oh-my-zsh-custom-dir";
    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${agnoster-nix-theme} $out/themes/agnoster-nix.zsh-theme  
    '';
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = with pkgs.nur.repos.chisui.zsh-plugins; [
      zsh-nix-shell
    ];
    shellAliases = {
      code = "codium";
      pass = "gopass";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster-nix";
      custom = "${customDir}";
    };
  };
}
