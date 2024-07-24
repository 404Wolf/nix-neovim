{
  plugins.nix-develop = {
    enable = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>nd";
      action = ":NixDevelop<cr>";
      options = {
        noremap = true;
        silent = true;
        desc = "Run `nix develop` without leaving neovim";
      };
    }
  ];
}
