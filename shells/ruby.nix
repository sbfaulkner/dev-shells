{ pkgs }:

pkgs.mkShell {
  name = "ruby";

  packages = with pkgs; [
    ruby_3_3
    libyaml
    sqlite
  ];
}
