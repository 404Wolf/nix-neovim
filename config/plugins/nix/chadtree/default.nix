{pkgs, ...}: {
  plugins.chadtree = {
    enable = true;
    package = pkgs.vimPlugins.chadtree.overrideAttrs (prev: {
      patches = [./think-in-venv.patch];
    });
  };
  extraConfigLua =
    # lua
    ''
      chadtree_settings = {
        view = { width = 28 },
      }
      vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

      -- Function to close CHADTree if active when switching tabs
      local function close_chadtree()
        if vim.bo.filetype == 'chadtree' then
          vim.cmd('quit')
        end
      end

      -- Set up autocommand in Lua
      vim.api.nvim_create_autocmd('TabEnter', {
        callback = close_chadtree,
      })
    '';
}
