{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Philipp Dargel";
    userEmail = "philipp.dargel@neuland.de";
  };
}
