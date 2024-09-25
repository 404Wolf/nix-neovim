{
  description = "Wolf's Neovim Configuration";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:NixOS/nixpkgs/68c9ed8bbed9dfce253cc91560bf9043297ef2fe";
    nix-bundle = {
      url = "github:ralismark/nix-appimage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        nixpkgs-old = import inputs.nixpkgs-old {inherit system;};
        pkgs = import nixpkgs {
          inherit system;
          overlays = import ./overlays.nix {inherit nixpkgs-old;};
        };

        lspPackages = import ./config/lsps/lsp-packages.nix {inherit pkgs;};
        nixvim' = nixvim.legacyPackages.${system};
        nvim' = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = ./config;
        };
      in {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              (
                python3.withPackages (pyPkgs: with pyPkgs; [pytest])
              )
            ];
          };
        };
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
          nvim-appimage = inputs.nix-bundle.lib.${system}.mkAppImage {
            program = "${nvim}/bin/nvim";
          };
        };
      }
    );
}
