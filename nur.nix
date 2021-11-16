{ pkgs }:
import (builtins.fetchTarball {
  url = "https://github.com/nix-community/NUR/archive/d8a4599f853719f2ec9ff7c386ad5e7f6b425e89.tar.gz";
  sha256 = "0rw3h06cv5awqyqrqkyyk1zwpqzfx6jkyhjdr8qjg09vr5587cpb";
}) { inherit pkgs; }
