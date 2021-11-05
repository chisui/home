{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.gopass
  ];
  xdg.configFile."gopass/config.yml".text = builtins.toJSON {
    autoclip = false;
    autoimport = true;
    cliptimeout = 45;
    exportkeys = true;
    nocolor = false;
    nopager = false;
    notifications = true;
    parsing = true;
    path = "${config.home.homeDirectory}/.local/share/gopass/stores/root";
    safecontent = false;
  };
}
