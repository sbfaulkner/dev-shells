{ pkgs, rubyBundle ? null }:

let lib = pkgs.lib; in
pkgs.mkShell {
  name = "ruby-4-0";

  packages = with pkgs; lib.optional (rubyBundle != null) rubyBundle ++ [
    ruby_4_0
    libyaml
    pkg-config
  ];
}
