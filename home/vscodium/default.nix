{ pkgs, ... }@args:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = import ./settings args;
    extensions = import ./extensions.nix args;
  };
}
