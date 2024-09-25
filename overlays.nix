{nixpkgs-old}: [
  (final: prev: let
    pkgs = prev;
  in {
    nodePackages_latest =
      pkgs.nodePackages_latest
      // {
        bash-language-server = nixpkgs-old.nodePackages_latest.bash-language-server;
      };
    vimPlugins =
      prev.vimPlugins
      // {
        chadtree = pkgs.vimUtils.buildVimPlugin {
          pname = "chadtree";
          version = "2024-05-10";
          src = pkgs.fetchFromGitHub {
            owner = "ms-jpq";
            repo = "chadtree";
            rev = "7334155c68acd932e275fbf203f05eebf7f741ed";
            sha256 = "1f9bmaj0lhiwzig0g36gbsy3mkq2lmcqx762h4z3kn1acci3dlk1";
            meta.homepage = "https://github.com/ms-jpq/chadtree/";
          };
        };
        nvim-lspimport = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-lspimport";
          version = "2024-07-23";
          src = pkgs.fetchFromGitHub {
            owner = "stevanmilic";
            repo = "nvim-lspimport";
            rev = "4fef458b8853b1b90b55054ed6c3f98fff094cd1";
            sha256 = "sha256-JIbd4ygOGuNsg6fZnlN9iz7hfN4LQWM6VSJy4Qh9LJg=";
            meta.homepage = "https://github.com/stevanmilic/nvim-lspimport";
          };
        };
        copilot-status = pkgs.vimUtils.buildVimPlugin {
          name = "copilot-status";
          version = "2024-07-23";
          src = pkgs.fetchFromGitHub {
            owner = "jonahgoldwastaken";
            repo = "copilot-status.nvim";
            rev = "decbffa57732f3d257641aea1d5541dd4fe536f6";
            sha256 = "sha256-jJqbMuTjTN2n7s2iXAoxJDKiRCFkBdpJEHap5KphKbM=";
            meta.homepage = "https://github.com/jonahgoldwastaken/copilot-status.nvim";
          };
        };
        telescope-git-file-history = pkgs.vimUtils.buildVimPlugin {
          name = "telescope-git-file-history";
          version = "2024-08-04";
          src = pkgs.fetchFromGitHub {
            owner = "isak102";
            repo = "telescope-git-file-history.nvim";
            rev = "f94fab1d5a51fa28dd95b1a6bd377505dc1a8e82";
            sha256 = "sha256-7cVmZaseWntB339DSB4sNKIMQkwkhLPBYEuLlVg0J28=";
            meta.homepage = "https://github.com/isak102/telescope-git-file-history.nvim";
          };
        };
      };
  })
]
