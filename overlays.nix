[
  (final: prev: {
    vimPlugins = prev.vimPlugins // {
      telescope-git-file-history = prev.vimUtils.buildVimPlugin {
        name = "telescope-git-file-history";
        version = "2024-08-04";
        src = prev.fetchFromGitHub {
          owner = "isak102";
          repo = "telescope-git-file-history.nvim";
          rev = "e7d495319f2a04df96402057a6992ea970f8914d";
          sha256 = "sha256-wQJqKBBcJl9JAvyN+jxTbLUdqnd4j1wzZaxmmbontok=";
        };
      };
      sidekick = prev.vimUtils.buildVimPlugin {
        name = "sidekick.nvim";
        version = "1.2.0";
        src = prev.fetchFromGitHub {
          owner = "folke";
          repo = "sidekick.nvim";
          rev = "v1.2.0";
          sha256 = "sha256-so/28fFNL1xZv/SFoAbdRKXx11NvDQ2Nxa5TD8Tmtjs=";
        };
        doCheck = false;
      };
    };
  })
]
