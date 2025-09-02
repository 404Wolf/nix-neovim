{
  keymaps = [
    # Toggle nvim-tree with Ctrl+n
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

    # Window navigation with Ctrl+h/j/k/l
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
      options = {
        silent = true;
        noremap = true;
        desc = "Move to left window";
      };
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
      options = {
        silent = true;
        noremap = true;
        desc = "Move to bottom window";
      };
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
      options = {
        silent = true;
        noremap = true;
        desc = "Move to top window";
      };
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
      options = {
        silent = true;
        noremap = true;
        desc = "Move to right window";
      };
    }
  ];
}
