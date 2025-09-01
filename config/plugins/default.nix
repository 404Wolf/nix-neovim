{
  imports = [
    ./telescope.nix
    ./gitsigns.nix
    ./treesitter.nix
    ./codecompanion.nix
    ./cmp.nix
    ./lualine.nix
  ];

  plugins = {
    web-devicons.enable = true;
    virt-column.enable = true;
    yazi.enable = true;
    comment.enable = true;
    vim-matchup.enable = true;
    copilot-vim.enable = true;
  };

  keymaps = [
    {
      key = "<C-n>";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>Yazi<cr>";
      options.desc = "Open yazi at the current file";
    }
  ];
}
