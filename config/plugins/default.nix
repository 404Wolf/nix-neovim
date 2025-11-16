{ pkgs, ... }:
{
  imports = [
    ./telescope.nix
    ./gitsigns.nix
    ./treesitter.nix
    ./codecompanion.nix
    ./cmp.nix
    ./nvim-tree.nix
    ./barbar.nix
    ./copilot.nix
    ./fidget.nix
    ./matchup.nix
  ];

  plugins = {
    snacks.enable = true;
    web-devicons.enable = true;
    virt-column.enable = true;
    comment.enable = true;
    vim-matchup.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [
    onedarkpro-nvim
    telescope-git-file-history
    fugitive
    mdx
  ];

  extraConfigLuaPost = # lua
    ''
      require("mdx").setup()
    '';
}
