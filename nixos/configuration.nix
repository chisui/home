{ config, pkgs, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs1: {
      nur = import ./nur.nix { pkgs = pkgs1; };
    };
  };
  imports = [
    ./hardware-configuration.nix
    ./users.nix
  ];

  virtualisation.docker.enable = true;

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      efiSupport = true;
    };
  };

  time.timeZone = "Europe/Berlin";

  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "de";
    xkbOptions = "eurosign:e";
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };

  services = {
    tlp.enable = true;
    printing.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      wget vim git
    ];
    pathsToLink = [
      "/share/zsh"
      "/libexec"
    ];
  };

  programs = {
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  system.stateVersion = "20.09"; # DON'T TOUCH THIS!!!
}

