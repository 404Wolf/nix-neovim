{
  plugins.quarto.enable = true;

  plugins.otter = {
    enable = true;
  };

  extraConfigLuaPost = # lua
    ''
      local original_activate = require("otter").activate
      require("otter").activate = function(...)
        if vim.bo.filetype ~= "nix" then
          original_activate(...)
        end
      end
    '';
}
