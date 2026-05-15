{ pkgs }:

pkgs.mkShell {
  name = "go-1-25";

  packages = with pkgs; [
    go_1_25
    gotools
  ];
}
