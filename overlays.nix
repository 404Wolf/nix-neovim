{repos}: [
  (final: prev: {
    luajitPackages.neotest = null;

    vimPlugins =
      prev.vimPlugins
      // {
        nvim-lspimport = prev.vimUtils.buildVimPlugin {
          name = "nvim-lspimport";
          version = "2024-07-23";
          src = repos.nvim-lspimport;
        };

        copilot-status = prev.vimUtils.buildVimPlugin {
          name = "copilot-status";
          version = "2024-07-23";
          src = repos.copilot-status;
        };

        telescope-git-file-history = prev.vimUtils.buildVimPlugin {
          name = "telescope-git-file-history";
          version = "2024-08-04";
          src = repos.telescope-git-file-history;
        };
      };
  })
]
