{
  nixpkgs-old,
  repos,
}: [
  (final: prev: let
    pkgs = prev;
  in {
    vimPlugins =
      prev.vimPlugins
      // {
        nvim-lspimport = pkgs.vimUtils.buildVimPlugin {
          name = "nvim-lspimport";
          version = "2024-07-23";
          src = repos.nvim-lspimport;
        };

        copilot-status = pkgs.vimUtils.buildVimPlugin {
          name = "copilot-status";
          version = "2024-07-23";
          src = repos.copilot-status;
        };
        telescope-git-file-history = pkgs.vimUtils.buildVimPlugin {
          name = "telescope-git-file-history";
          version = "2024-08-04";
          src = repos.telescope-git-file-history;
        };
      };
  })
]
