{
  description = "Wolf's Neovim Configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    older-pkgs.url = "github:NixOS/nixpkgs/68c9ed8bbed9dfce253cc91560bf9043297ef2fe";
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
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        older-pkgs = import inputs.older-pkgs {inherit system;};
        pkgs = import nixpkgs {
          inherit system;
          overlays = import ./overlays.nix {nixpkgs-bashls = older-pkgs;};
        };
        lspPackages = import ./config/lsps/lsp-packages.nix {inherit pkgs;};
        nixvim' = nixvim.legacyPackages.${system};
        nvim' = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
        };
      in {
        packages = rec {
          default = nvim;
          nvim = pkgs.symlinkJoin {
            name = "nvim";
            paths = [nvim'];
            buildInputs = [pkgs.makeWrapper];
            postBuild = ''
              wrapProgram $out/bin/nvim \
                --suffix PATH : ${pkgs.lib.makeBinPath lspPackages}
            '';
          };
        };
      }
    );
}
