{ pkgs, ... }:
with pkgs; {
 "nix.enableLanguageServer" = true;
  "nix.formatterPath" = "${nixpkgs-fmt}/bin/nixpkgs-fmt";
  "nix.serverPath"    = "${rnix-lsp}/bin/rnix-lsp";
}
