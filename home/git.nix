{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Philipp Dargel";
    userEmail = "chisui.pd@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };
}
