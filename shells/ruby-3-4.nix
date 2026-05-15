{ pkgs }:

pkgs.mkShell {
  name = "ruby-3-4";

  packages = with pkgs; [
    ruby_3_4
    libyaml
  ];
}
