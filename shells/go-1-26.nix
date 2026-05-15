{ pkgs }:

pkgs.mkShell {
  name = "go-1-26";

  packages = with pkgs; [
    go_1_26
    gotools
  ];
}
