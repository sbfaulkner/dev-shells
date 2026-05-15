{
  description = "Reusable dev shells for use with direnv or nix develop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
        in
        {
          ruby-3-3 = import ./shells/ruby-3-3.nix { inherit pkgs; };
          ruby-3-4 = import ./shells/ruby-3-4.nix { inherit pkgs; };
          ruby-4-0 = import ./shells/ruby-4-0.nix { inherit pkgs; };
          go-1-24  = import ./shells/go-1-24.nix  { inherit pkgs; };
          go-1-25  = import ./shells/go-1-25.nix  { inherit pkgs; };
          go-1-26  = import ./shells/go-1-26.nix  { inherit pkgs; };
          sqlite = import ./shells/sqlite.nix { inherit pkgs; };
          ragel  = import ./shells/ragel.nix  { inherit pkgs; };
        }
      );
    };
}
