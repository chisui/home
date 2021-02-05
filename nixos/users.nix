{ config, lib, pkgs, modulesPath, ... }:

{
  users.users = {
    chisui = {
      isNormalUser = true;
      home = "/home/chisui";
      extraGroups = [ "wheel" "NetworkManager" ];
      shell = pkgs.zsh;
    };
  };
}

