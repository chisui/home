{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    extensions = (
      with pkgs.nur.repos.chisui.chromium-extensions; [
        umatrix
        ublock-origin
        browserpass
        react-devtools
        redux-devtools
      ]);
  };
}
