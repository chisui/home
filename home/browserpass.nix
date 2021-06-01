{ config, pkgs, ... }:
{
  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
      "chromium"
    ];
  };
}
