{ pkgs, goMod ? null }:

let lib = pkgs.lib; in
pkgs.mkShell {
  name = "go-1-24";

  packages = with pkgs; lib.optional (goMod != null) goMod ++ [
    go_1_24
    gotools
  ];
}
