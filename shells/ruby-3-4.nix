{ pkgs, rubyBundle ? null }:

let lib = pkgs.lib; in
pkgs.mkShell {
  name = "ruby-3-4";

  packages = with pkgs; lib.optional (rubyBundle != null) rubyBundle ++ [
    ruby_3_4
    libyaml
    pkg-config
  ];
}
