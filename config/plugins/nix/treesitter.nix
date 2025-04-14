{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    folding = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      indent = {
        enable = true;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gnn";
          scope_incremental = "grc";
          node_decremental = "grm";
        };
      };
    };
  };
  plugins.treesitter-context = {
    enable = true;
  };
  plugins.treesitter-refactor = {enable = true;};
  plugins.treesitter-textobjects = {enable = true;};
}
