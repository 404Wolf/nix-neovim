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

      -- Function to close CHADTree if active when switching tabs
      local function close_chadtree()
        if vim.bo.filetype == 'chadtree' then
          vim.cmd('quit')
        end
      end
    '';
}
