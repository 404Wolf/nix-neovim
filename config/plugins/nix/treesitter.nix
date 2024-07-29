{
  config,
  pkgs,
  ...
}: {
  plugins.treesitter = {
    enable = true;
    gccPackage = null;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    folding = false;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
      };
      indent = {
        enable = true;
      };
    };
  };
  plugins.treesitter-context = {
    enable = true;
  };
  plugins.treesitter-refactor = {enable = true;};
  plugins.treesitter-textobjects = {enable = true;};
}
