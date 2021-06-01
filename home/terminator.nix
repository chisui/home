{ config, pkgs, ... }:
let
  font = "Droid Sans Mono for Powerline 10";
in {
  home = {
    packages = [ pkgs.terminator ];
    file.".config/terminator/config".text = ''
      [global_config]
        borderless = True
        title_use_system_font = False
        title_font = ${font}
      [profiles]
        [[default]]
          cursor_color = "#aaaaaa"
          use_system_font = False
          font = ${font}
          show_titlebar = False
          palette = "#073642:#dc322f:#859900:#b58900:#268bd2:#d33682:#2aa198:#eee8d5:#002b36:#cb4b16:#586e75:#657b83:#839496:#6c71c4:#93a1a1:#fdf6e3"
    '';
  };
}
