{ pkgs }:

pkgs.mkShell {
  name = "ruby";

  packages = with pkgs; [
    ruby
    libyaml
  ];
}
