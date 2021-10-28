{ pkgs, ... }@args:
pkgs.lib.foldr (path: cfg: cfg // (import path args)) 
{
  "workbench.startupEditor" = "none";
  "workbench.editor.enablePreview" = false;

  # Disable history
  "workbench.editor.untitled.hint" = "hidden";
  "workbench.commandPalette.history" = 0;
  "task.quickOpen.history" = 0;
} [
  ./rust.nix
  ./java.nix
  ./nix.nix
  ./console.nix
]
