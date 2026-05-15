{ pkgs, rubyBundle ? null }:

let lib = pkgs.lib; in
pkgs.mkShell {
  name = "ruby-3-3";

  packages = with pkgs; lib.optional (rubyBundle != null) rubyBundle ++ [
    ruby_3_3
    libyaml
    pkg-config
  ];
}
