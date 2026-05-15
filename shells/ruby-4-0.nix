{ pkgs }:

pkgs.mkShell {
  name = "ruby-4-0";

  packages = with pkgs; [
    ruby_4_0
    libyaml
  ];
}
