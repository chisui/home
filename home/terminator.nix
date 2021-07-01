{ config, pkgs, ... }:
let
  theme = import ./solarized-dark.nix;

  font = with theme.font; "${family} ${builtins.toString size}";
  
  palette = pkgs.lib.concatStringsSep ":" (with theme.color; [
          black       red       green       yellow       blue       magenta       cyan       white
    brightBlack brightRed brightGreen brightYellow brightBlue brightMagenta brightCyan brightWhite
  ]);
in {
  programs.terminator = {
    enable = true;
    config = {
      global_config = {
        borderless = true;
        title_use_system_font = false;
        title_font = font;
      };
      profiles.default = {
        inherit font palette;
        use_system_font = false;
        show_titlebar = false;
        background_color = theme.color.background;
      };
    };
  };
}
