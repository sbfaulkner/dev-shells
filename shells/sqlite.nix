{ pkgs }:

pkgs.mkShell {
  name = "sqlite";

  packages = with pkgs; [
    sqlite
  ];
}
