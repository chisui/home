{ pkgs, ... }:
{
  extensions = [
    # currently broken?
    # pkgs.vscode-extensions.matklad.rust-analyzer
  ];
  settings = {
    # manage rust through mozilla nix overlay by default instead of rustup
    "rust-client.disableRustup" = true;
    # use project specific rust-analyzer
    "rust-analyzer.server.path" = "rust-analyzer";
  };
}
