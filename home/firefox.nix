{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      chisui = {
        isDefault = true;
      };
    };
    extensions = (
      with pkgs.nur.repos.rycee.firefox-addons;
      with pkgs.nur.repos.chisui.firefox-addons; [
        umatrix
        ublock-origin
        browserpass
        react-devtools
        redux-devtools
      ]);
  };
}
