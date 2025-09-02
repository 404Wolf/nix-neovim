{
  plugins.nvim-tree = {
    enable = true;

    settings = {
      view = {
        width = 30;
        side = "right";
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
