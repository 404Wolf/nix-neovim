{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    sidekick
  ];

  extraPackages = with pkgs; [
    copilot-language-server-fhs
  ];

  extraConfigLuaPost = # lua
    ''
      vim.lsp.enable('copilot')
      require("sidekick").setup()
    '';

  keymaps = [
    {
      key = "<alt-l>";
      action = "<cmd>lua if not require('sidekick').nes_jump_or_apply() then vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', true) end<cr>";
    }
  ];
}
