{ pkgs, ... }@args:
let
  importConfig = path: { settings ? { }, extensions ? [ ] }:
    let
      cfg = import path args;
    in
    {
      settings = settings // (if cfg?settings then cfg.settings else { });
      extensions = extensions ++ (if cfg?extensions then cfg.extensions else [ ]);
    };
  imported = pkgs.lib.foldr importConfig { } [
    ./rust.nix
    ./java.nix
    ./pegjs.nix
    ./nix.nix
    ./console.nix
    ./haskell.nix
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = {
      "workbench.startupEditor" = "none";
      "workbench.editor.enablePreview" = false;

      # Disable history
      "workbench.editor.untitled.hint" = "hidden";
      "workbench.commandPalette.history" = 0;
      "task.quickOpen.history" = 0;
    } // imported.settings;
    extensions = imported.extensions;
  };
}
