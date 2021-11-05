{ pkgs, ... }:
with pkgs; {
  extensions = [
    vscode-extensions.jnoortheen.nix-ide
  ];
  settings = {
    "nix.enableLanguageServer" = true;
    "nix.formatterPath" = "${nixpkgs-fmt}/bin/nixpkgs-fmt";
    "nix.serverPath" = "${rnix-lsp}/bin/rnix-lsp";
  };
}
