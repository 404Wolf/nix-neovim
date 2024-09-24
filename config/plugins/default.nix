{pkgs, ...}: {
  imports = [
    ./nix/alpha.nix
    ./nix/auto-save.nix
    ./nix/autopairs.nix
    ./nix/barbar.nix
    ./nix/chadtree
    ./nix/comment.nix
    ./nix/conform.nix
    ./nix/copilot-lua.nix
    ./nix/coq.nix
    ./nix/dap.nix
    ./nix/dev-icons.nix
    ./nix/dressing.nix
    ./nix/fugitive.nix
    ./nix/gitsigns.nix
    ./nix/indent-blankline.nix
    ./nix/marks.nix
    ./nix/nix-develop.nix
    ./nix/nvim-colorizer.nix
    ./nix/telescope.nix
    ./nix/treesitter.nix
    ./nix/ts-autotag.nix
    ./nix/virt-column.nix
  ];
  luaLoader.enable = true;
  extraPlugins = [
    pkgs.vimPlugins.nvim-jdtls
    pkgs.vimPlugins.onedarkpro-nvim
    pkgs.vimPlugins.actions-preview-nvim
    pkgs.vimPlugins.lualine-nvim
    pkgs.vimPlugins.copilot-status
    pkgs.vimPlugins.telescope-git-file-history
    # pkgs.vimPlugins.nvim-lspimport
  ];
  extraConfigLuaPost = ''
    ${toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
    ])}
  '';
}
