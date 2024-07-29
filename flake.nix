{
  description = "Wolf's Neovim Configuration";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
        };
      in {
        packages.default = pkgs.symlinkJoin {
          name = "nvim";
          paths = [nvim];
          buildInputs = [pkgs.makeWrapper];
          postBuild = ''
            wrapProgram $out/bin/nvim \
              --argv0 neovim \
              --run 'export PATH=$PATH:${
              pkgs.lib.makeBinPath (import ./config/lsps/lsp-packages.nix {inherit pkgs;})
            }'
          '';
        };
      }
    );
}
