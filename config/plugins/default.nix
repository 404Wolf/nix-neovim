{pkgs, ...}: {
  imports = [
    ./nix/alpha.nix
    ./nix/auto-save.nix
    ./nix/barbar.nix
    ./nix/chadtree.nix
    ./nix/comment.nix
    ./nix/codecompanion.nix
    ./nix/conform.nix
    ./nix/copilot-lua.nix
    ./nix/coq.nix
    ./nix/dressing.nix
    ./nix/gitsigns.nix
    ./nix/marks.nix
    ./nix/telescope.nix
    ./nix/treesitter.nix
    ./nix/virt-column.nix
    ./nix/matchup.nix
  ];

  plugins = builtins.listToAttrs (builtins.map
    (item: {
      name = item;
      value = {enable = true;};
    }) [
      "rustaceanvim"
      "ts-autotag"
      "web-devicons"
      "indent-blankline"
      "nvim-autopairs"
      "colorizer"
      "tmux-navigator"
    ]);

  luaLoader.enable = true;

  extraPlugins = with pkgs.vimPlugins; [
    nvim-jdtls
    onedarkpro-nvim
    actions-preview-nvim
    lualine-nvim
    copilot-status
    telescope-git-file-history
    nvim-lspimport
    fugitive
  ];

  extraConfigLuaPost = ''
    ${toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
    ])}
  '';
}
