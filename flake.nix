{
  description = "Reusable dev shells for use with direnv or nix develop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      pkgsFor = system: nixpkgs.legacyPackages.${system};
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = pkgsFor system;

          rubyBundle = pkgs.writeScriptBin "ruby-bundle" ''
            #!${pkgs.bash}/bin/bash
            set -euo pipefail
            if [ ! -f Gemfile ]; then
              echo "No Gemfile found; nothing to do."
              exit 0
            fi
            if ! ${pkgs.ruby}/bin/bundle check >/dev/null 2>&1; then
              echo "Missing gems; running bundle install..."
              ${pkgs.ruby}/bin/bundle install --jobs=4 --retry=3
            else
              echo "Gems up-to-date."
            fi
          '';

          goMod = pkgs.writeScriptBin "go-mod" ''
            #!${pkgs.bash}/bin/bash
            set -euo pipefail
            if [ ! -f go.mod ]; then
              echo "No go.mod found; nothing to do."
              exit 0
            fi
            if ! ${pkgs.go}/bin/go list -m all >/dev/null 2>&1; then
              echo "Fetching Go modules..."
              ${pkgs.go}/bin/go mod download
            else
              echo "Go modules fetched."
            fi
          '';
        in
        {
          ruby-3-3 = import ./shells/ruby-3-3.nix { inherit pkgs; rubyBundle; };
          ruby-3-4 = import ./shells/ruby-3-4.nix { inherit pkgs; rubyBundle; };
          go-1-24  = import ./shells/go-1-24.nix  { inherit pkgs; goMod; };
          go-1-25  = import ./shells/go-1-25.nix  { inherit pkgs; goMod; };
          sqlite = import ./shells/sqlite.nix { inherit pkgs; };
          ragel  = import ./shells/ragel.nix  { inherit pkgs; };
        }
      );
    };
}
