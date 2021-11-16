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

  virtualisation = {
    docker.enable = true;
    virtualbox = {
      host.enable = true;
      guest.enable = true;
    };
  };

#  boot.kernelPackages = pkgs.linuxPackages_5_12; # broken wifi support in 5.x
  boot.kernelParams = [ "intel_iommu=on" ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      device = "nodev";
      efiSupport = true;
      font="${pkgs.powerline-fonts}/share/fonts/opentype/Droid\\ Sans\\ Mono\\ for\\ Powerline.otf";
      fontSize = 32;
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
    videoDrivers = [ "modesetting" "nvidia" ];
    displayManager = {
      xserverArgs = [
        "-dpi 200"
      ];
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

#  services.tlp.enable = true;
#  services.printing.enable = true;

  environment = {
    systemPackages = with pkgs; [
      wget vim git
      zsh
      xorg.xf86inputsynaptics
      powerline-fonts
    ];
    pathsToLink = [
      "/share/zsh"
      "/libexec"
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.steam.enable = true;

  system.stateVersion = "20.09"; # DON'T TOUCH THIS!!!
}

