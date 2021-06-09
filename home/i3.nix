{ config, pkgs, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      modifier = "Mod4"; # SuperKey
      keybindings = let
        volumeStep = "5";
        brightnessStep = "5%";
        exec = cmd: "exec --no-startup-id ${cmd}";
        brightnessctl = op: exec "${pkgs.brightnessctl}/bin/brightnessctl set ${brightnessStep}${op}";
        in lib.mkOptionDefault {
          "${modifier}+Return" = exec "${pkgs.terminator}/bin/terminator";

          "XF86AudioRaiseVolume" = exec "pactl set-sink-volume 0 +${volumeStep}%";
          "XF86AudioLowerVolume" = exec "pactl set-sink-volume 0 -${volumeStep}%";
          "XF86AudioMute"        = exec "pactl set-sink-mute 0 toggle";
          "XF86AudioMicMute"     = exec "pactl set-source-mute 1 toggle";

          "XF86MonBrightnessUp"   = brightnessctl "+";
          "XF86MonBrightnessDown" = brightnessctl "-";
        };
    };
  };
}
