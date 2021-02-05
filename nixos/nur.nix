{ pkgs }:
import (builtins.fetchTarball {
  url = "https://github.com/nix-community/NUR/archive/df52655b88a1292763ecff5d2b118fac431869a8.tar.gz";
  sha256 = "041fb0p466ixa6qppj6xyr2724x4gpqn4053vcgil9wv2h070p15";
}) { inherit pkgs; }
