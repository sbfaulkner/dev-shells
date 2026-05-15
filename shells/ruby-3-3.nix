{ pkgs }:

pkgs.mkShell {
  name = "ruby-3-3";

  packages = with pkgs; [
    ruby_3_3
    libyaml
  ];
}
