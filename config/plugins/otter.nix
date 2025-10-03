{
  plugins.otter = {
    enable = true;
    settings = {
      buffers = {
        write_to_disk = true;
      };
    };
  };

  # extraConfigLuaPost = # lua
  #   ''
  #     local original_activate = require("otter").activate
  #     require("otter").activate = function(...)
  #       if vim.bo.filetype ~= "nix"
  #         and vim.api.nvim_buf_get_name(0) ~= "" -- not an empty buffer
  #       then
  #         original_activate(...)
  #       end
  #     end
  #   '';
}
