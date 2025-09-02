{
  imports = [
    ./telescope.nix
    ./gitsigns.nix
    ./treesitter.nix
    ./codecompanion.nix
    ./cmp.nix
    ./nvim-tree.nix
    ./lualine.nix
  ];

  plugins = {
    web-devicons.enable = true;
    virt-column.enable = true;
    comment.enable = true;
    vim-matchup.enable = true;
    copilot-vim.enable = true;
  };
}
