{ pkgs }:

pkgs.mkShell {
  name = "ragel";

  packages = with pkgs; [
    ragel
  ];
}
