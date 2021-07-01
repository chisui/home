{ config, pkgs, ... }:
let
  theme = import ./solarized-dark.nix;
  font = "${theme.font.family} ${builtins.toString theme.font.size}";
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
        use_system_font = false;
        font = font;
        show_titlebar = false;
        background_color = theme.color.background;
        palette = "${pkgs.lib.concatStringsSep ":" theme.color.palette}";
      };
    };
  };
}
