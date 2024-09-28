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
    ./nix/neotest.nix
    ./nix/nix-develop.nix
    ./nix/nvim-colorizer.nix
    ./nix/telescope.nix
    ./nix/treesitter.nix
    ./nix/ts-autotag.nix
    ./nix/virt-column.nix
  ];
  luaLoader.enable = true;
  extraPlugins = with pkgs.vimPlugins; [
    nvim-jdtls
    onedarkpro-nvim
    actions-preview-nvim
    lualine-nvim
    copilot-status
    telescope-git-file-history
    nvim-lspimport
  ];
  extraConfigLuaPost = ''
    ${toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
    ])}
  '';
}
