{config, ...}: {
  plugins.treesitter = {
    enable = true;
    gccPackage = null;
    folding = true;
    grammarPackages = config.plugins.treesitter.package.passthru.allGrammars;
    settings = {
      auto_install = false;
      ensure_installed = "all";
      highlight = {
        additional_vim_regex_highlighting = true;
        custom_captures = {};
        enable = true;
      };
      indent = {
        enable = true;
      };
      sync_install = false;
    };
  };
}
