{
  imports = [
    ./telescope.nix
    ./gitsigns.nix
    ./treesitter.nix
    ./codecompanion.nix
    ./cmp.nix
    ./nvim-tree.nix
    ./barbar.nix
    ./otter.nix
    ./copilot.nix
    ./fidget.nix
  ];

  plugins = {
    web-devicons.enable = true;
    virt-column.enable = true;
    comment.enable = true;
    vim-matchup.enable = true;
    quarto.enable = true;
  };
}
