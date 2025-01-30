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
    nvim-lspimport = {
      url = "github:stevanmilic/nvim-lspimport";
      flake = false;
    };
    copilot-status = {
      url = "github:jonahgoldwastaken/copilot-status.nvim";
      flake = false;
    };
    telescope-git-file-history = {
      url = "github:isak102/telescope-git-file-history.nvim";
      flake = false;
    };
    std2_ms-jpq = {
      url = "github:ms-jpq/std2";
      flake = false;
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
          overlays = import ./overlays.nix {
            inherit nixpkgs-old;
            inherit (inputs) std2_ms-jpq;
            repos = {
              inherit
                (inputs)
                nvim-lspimport
                copilot-status
                telescope-git-file-history
                ;
            };
          };
        };

        lspPackages = import ./config/lsps/packages.nix {inherit pkgs;};
        nixvim' = nixvim.legacyPackages.${system};
        nvim' = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          extraSpecialArgs = inputs;
          module = ./config;
        };
      in {
        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              (python3.withPackages (pyPkgs: with pyPkgs; [pytest]))
              lua-language-server
              luajitPackages.lua-lsp
              luarocks-nix
              stylua
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
                --suffix LS_COLORS : ${pkgs.lib.escapeShellArg (builtins.readFile ./ls_colors)} \
                --prefix PATH : ${pkgs.lib.makeBinPath lspPackages}
            '';
          };
          nvim-appimage = inputs.nix-bundle.lib.${system}.mkAppImage {
            program = "${nvim}/bin/nvim";
          };
        };
      }
    );
}
