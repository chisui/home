{ config, pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      modifier = "Mod4"; # SuperKey
      keybindings = let
        volumeStep = "5";
        in lib.mkOptionDefault {
          "${modifier}+Return" = "exec ${pkgs.terminator}/bin/terminator";
          "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +${volumeStep}%";
          "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -${volumeStep}%";
          "XF86AudioMute"        = "exec --no-startup-id pactl set-sink-mute 0 toggle";
          "XF86AudioMicMute"     = "exec --no-startup-id pactl set-source-mute 1 toggle";

          "XF86MonBrightnessUp"   = "exec --no-startup-id xrandr --output eDP-1 --brightness 1";
          "XF86MonBrightnessDown" = "exec --no-startup-id xrandr --output eDP-1 --brightness .1"; 
        };
    };
  };
}
