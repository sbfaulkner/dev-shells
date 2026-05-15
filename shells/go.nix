{ pkgs }:

pkgs.mkShell {
  name = "go";

  packages = with pkgs; [
    go_1_24
    gotools
    ragel
  ];
}
