{
  plugins.chadtree = {
    enable = true;
  };
  extraConfigLua =
    # lua
    ''
      local chadtree_settings = {
        xdg = true,
      	view = { width = 28 },
      }
      vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
    '';
}
