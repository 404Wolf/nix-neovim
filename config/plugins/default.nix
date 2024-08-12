{pkgs, ...}: {
  imports = [
    ./nix/indent-blankline.nix
    ./nix/nix-develop.nix
    ./nix/telescope.nix
    ./nix/coq.nix
    ./nix/chadtree.nix
    ./nix/treesitter.nix
    ./nix/barbar.nix
    ./nix/nvim-colorizer.nix
    ./nix/conform.nix
    ./nix/autopairs.nix
    ./nix/virt-column.nix
    ./nix/auto-save.nix
    ./nix/gitsigns.nix
    ./nix/copilot-lua.nix
    ./nix/dap.nix
    ./nix/comment.nix
    ./nix/fugitive.nix
    ./nix/dressing.nix
    ./nix/gitconflict.nix
    ./nix/ts-autotag.nix
    ./nix/marks.nix
    ./nix/alpha.nix
  ];
  luaLoader.enable = true;
  plugins = {
    # Dashboard
    alpha = {
      enable = true;
      theme = "dashboard";
      iconsEnabled = true;
    };
  };
  extraPlugins = [
    pkgs.vimPlugins.nvim-jdtls
    pkgs.vimPlugins.onedarkpro-nvim
    pkgs.vimPlugins.actions-preview-nvim
    pkgs.vimPlugins.lualine-nvim
    pkgs.vimPlugins.aerial-nvim
    pkgs.vimPlugins.nvim-lspimport
    pkgs.vimPlugins.copilot-status
    pkgs.vimPlugins.nvim-lsp-file-operations
    pkgs.vimPlugins.telescope-git-file-history
  ];
  extraConfigLuaPost = ''
    ${toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
      ./lua/aerial.lua
      # ./lua/jdtls.lua
    ])}
  '';
}
