{
  plugins.nvim-tree = {
    enable = true;

    settings = {
      view = {
        width = 30;
        side = "right";
        preserve_window_proportions = true;
      };

      # default to yes for confirmations
      ui.default_yes = true;

      # follow the current file
      update_focused_file = {
        enable = true;
        update_root = false;
      };

      # show LSP diagnostics
      diagnostics = {
        enable = true;
        show_on_dirs = true;
      };

      renderer = {
        indent_markers = {
          enable = true;
        };
        icons = {
          show = {
            file = true;
            folder = true;
            folder_arrow = true;
            git = true;
          };
        };
      };
    };
  };

  keymaps = [
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      mode = "n";
      options = {
        silent = true;
        noremap = true;
        desc = "Toggle NvimTree";
      };
    }
  ];
}
