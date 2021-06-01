{ config, pkgs, ... }:
with pkgs.lib;
let
  packages = map (p: pkgs."${p}")
    (filter (x: x != "")
    (splitString "\n" (readFile ./packages.lst)));
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  home = {
    username = "chisui";
    homeDirectory = "/home/chisui";
    sessionVariables = {
      EDITOR = "vim";
    };
    inherit packages;
  };
  
  gtk.enable = true;
  gtk.gtk3.extraConfig = {
    gtk-cursor-theme-size = 64;
  };
  xsession.enable = true;
  xsession.initExtra = ''
    ${pkgs.numlockx}/bin/numlockx on
    xinput --set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 1.0
  '';
  xresources.properties = {
    "Xcursor.size" = 64;
  };

  imports = [
    ./home/zsh.nix
    ./home/git.nix
    ./home/i3.nix
    ./home/firefox.nix
    ./home/terminator.nix
    ./home/chromium.nix
    ./home/vscodium.nix
    ./home/direnv.nix
    ./home/browserpass.nix
  ];

  home.stateVersion = "21.03"; # DON'T CHANGE
}
