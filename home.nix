{ config, pkgs, ... }:
with pkgs.lib;
let
  packages = map (p: pkgs."${p}")
    (filter (x: x != "")
      (splitString "\n" (readFile ./packages.lst)));
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = rec {
    username = "chisui";
    homeDirectory = "/home/${username}";
    sessionVariables = {
      EDITOR = "vim";
    };
    inherit packages;
  };

  gtk = {
    enable = true;
  };
  xsession.enable = true;
  xsession.initExtra = ''
    ${pkgs.numlockx}/bin/numlockx on
    xinput --set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 1.0
  '';
  xresources.properties = {
    "Xft.dpi" = 200;
    "Xcursor.size" = 64;
  };

  imports = [
    ./home/browserpass.nix
    ./home/chromium.nix
    ./home/direnv.nix
    ./home/firefox.nix
    ./home/git.nix
    ./home/gopass.nix
    ./home/i3.nix
    ./home/intellij.nix
    ./home/less.nix
    ./home/terminator.nix
    ./home/vscodium
    ./home/zsh.nix
  ];

  home.stateVersion = "21.03"; # DON'T CHANGE
}
