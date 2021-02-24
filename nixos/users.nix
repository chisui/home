{ config, lib, pkgs, modulesPath, ... }:

{
  users.users = {
    chisui = {
      isNormalUser = true;
      home = "/home/chisui";
      extraGroups = [ "docker" "wheel" "NetworkManager" ];
      shell = pkgs.zsh;
    };
  };
}

