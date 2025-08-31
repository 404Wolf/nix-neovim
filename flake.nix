{
  description = "Wolf's Neovim Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = import ./overlays.nix;
        };

        nixvim' = nixvim.legacyPackages.${system};
        nvim' = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          extraSpecialArgs = inputs;
          module = ./config;
        };
      in
      {
        packages = rec {
          default = nvim;
          nvim = nvim';
        };
        formatter =
          let
            treefmtconfig = inputs.treefmt-nix.lib.evalModule pkgs {
              projectRootFile = "flake.nix";
              programs.nixfmt.enable = true;
              programs.shellcheck.enable = true;
              settings.formatter.shellcheck.excludes = [ ".envrc" ];
            };
          in
          treefmtconfig.config.build.wrapper;
      }
    );
}
