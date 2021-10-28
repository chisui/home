{ pkgs, ... }:
let
  console-theme = import ../../solarized-dark.nix;
in with console-theme; {
  "terminal.integrated.fontFamily" = font.family;
  "workbench.colorCustomizations" = with color; {
    "terminal.background" = background;

    "terminal.ansiBlack"   = black;
    "terminal.ansiRed"     = red;
    "terminal.ansiGreen"   = green;
    "terminal.ansiYellow"  = yellow;
    "terminal.ansiBlue"    = blue;
    "terminal.ansiMagenta" = magenta;
    "terminal.ansiCyan"    = cyan;
    "terminal.ansiWhite"   = white;
    "terminal.ansiBrightBlack"   = brightBlack;
    "terminal.ansiBrightRed"     = brightRed;
    "terminal.ansiBrightGreen"   = brightGreen;
    "terminal.ansiBrightYellow"  = brightYellow;
    "terminal.ansiBrightBlue"    = brightBlue;
    "terminal.ansiBrightMagenta" = brightMagenta;
    "terminal.ansiBrightCyan"    = brightCyan;
    "terminal.ansiBrightWhite"   = brightWhite;
  };
}