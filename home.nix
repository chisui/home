{ config, pkgs, ... }:
with pkgs.lib;
let
  update = pkgs.writeScriptBin "update" ''
    sudo nixos-rebuild switch --upgrade && home-manager switch
  '';
  packages = map (p: pkgs."${p}") (splitString "\n" (readFile ./packages.lst));
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
      "chromium"
    ];
  };

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "chisui";
    homeDirectory = "/home/chisui";
    sessionVariables = {
      EDITOR = "vim";
    };
    packages = [update] ++ packages;
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
  ];

  home.stateVersion = "21.03"; # DON'T CHANGE
}
