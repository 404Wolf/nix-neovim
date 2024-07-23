{pkgs, ...}: {
  imports = [
    ./nix/telescope.nix
    ./nix/coq.nix
    ./nix/chadtree.nix
    ./nix/barbar.nix
    ./nix/conform.nix
    ./nix/autopairs.nix
    ./nix/virt-column.nix
    ./nix/auto-save.nix
  ];
  extraPlugins = with pkgs.vimPlugins; [
    onedarkpro-nvim
    actions-preview-nvim
    lualine-nvim
  ];
  extraConfigLuaPost = toString (builtins.map (f: "${builtins.readFile f}\n") [
    ./lua/actions-preview.lua
    ./lua/lualine.lua
  ]);
  extraConfigLua =
    # lua
    ''
      -- Function to close the initial unnamed buffer
      local function close_initial_buffer()
          if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
              vim.cmd('silent! bd! 1')
          end
      end

      -- Autocommand to trigger the function on BufEnter
      vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "*",
          callback = close_initial_buffer
      })
    '';
}
