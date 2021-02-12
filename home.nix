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
    packages = with pkgs; [
      keepassxc
      thunderbird
      htop
      killall
      gopass
    ];
  };
  
  imports = [
    ./home/zsh.nix
    ./home/vscode.nix
    ./home/git.nix
    ./home/i3.nix
    ./home/firefox.nix
    ./home/chromium.nix
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
