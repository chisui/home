{ config, pkgs, ... }:

{
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
    packages = with pkgs; [
      keepassxc
      thunderbird
      htop
      killall
      gopass
      jetbrains.idea-ultimate
      vlc
      powerline-fonts
      tree
      file
      (writeScriptBin "update" ''
        #! /bin/sh
        sudo nixos-rebuild switch --upgrade && home-manager switch
      '')
    ];
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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
