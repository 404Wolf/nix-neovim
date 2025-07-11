{
  plugins.copilot-lua = {
    enable = true;
    autoLoad = true;
    settings = {
      panel = {
        enabled = true;
        auto_refresh = false;
        keymap = {
          jump_prev = "[[";
          jump_next = "]]";
          accept = "<CR>";
          refresh = "gr";
          open = "<A-CR>";
        };
        layout = {
          position = "bottom"; # | top | left | right
          ratio = 0.4;
        };
      };
      suggestion = {
        enabled = true;
        auto_trigger = true;
        hide_during_completion = true;
        debounce = 40;
        keymap = {
          accept = "<M-l>";
          accept_word = false;
          accept_line = false;
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      filetypes = {
        yaml = true;
        markdown = false;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
      copilot_node_command = "node"; # Node.js version must be > 18.x
      server_opts_overrides = {};
    };
  };

  extraConfigLua =
    # lua
    ''
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          require("copilot.suggestion").toggle_auto_trigger()
        end,
      });
    '';

  keymaps = [
    {
      mode = "n";
      key = "<A-CR>";
      action = ":Copilot panel <CR>";
    }
  ];
}
