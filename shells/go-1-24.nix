{ pkgs }:

pkgs.mkShell {
  name = "go-1-24";

  packages = with pkgs; [
    go
    gotools
  ];
}
