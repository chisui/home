{ config, pkgs, ... }:
let
  peg-js-ext = pkgs.fetchgit {
    url = "https://github.com/SrTobi/code-pegjs-language.git";
    rev = "2bf85d6414b5c9607d50335ede567f7505e9fe23";
    sha256 = "0m7ayc9kbk9yyrq341kai3vk20jrzwq900n1ifxy8s2w0y5qwbdx";
  };
in {
  home = {
    packages = [ pkgs.vscodium ];
    file.".vscode-oss/extensions/peg.js".source = peg-js-ext;
  };
}
