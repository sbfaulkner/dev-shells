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
        in
        {
          ruby   = import ./shells/ruby.nix   { inherit pkgs; };
          go     = import ./shells/go.nix     { inherit pkgs; };
          sqlite = import ./shells/sqlite.nix { inherit pkgs; };
          ragel  = import ./shells/ragel.nix  { inherit pkgs; };
        }
      );
    };
}
