{
  description = "How to build pretty fast websites";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.corepack.url = "github:alexghr/corepack.nix";
  inputs.corepack.inputs.nixpkgs.follows = "nixpkgs";

  inputs.flake-utils.url ="github:numtide/flake-utils";

  outputs = { self, nixpkgs, corepack, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];
          buildInputs = with pkgs; [
            nodejs-18_x
            corepack.packages.${system}.default
          ];
        };
      }
    );
}
