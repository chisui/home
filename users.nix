{ config, lib, pkgs, modulesPath, ... }:

{
  users.users = {
    chisui = {
      isNormalUser = true;
      home = "/home/chisui";
      extraGroups = [ "docker" "wheel" "NetworkManager" "jackaudio" "vboxuser" ];
      shell = pkgs.zsh;
    };
  };
}

