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
    }

    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
    }

    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
    }

    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
    }

    # close all buffers and exit (ctrl+q)
    {
      key = "<C-q>";
      action = ":bufdo bd<CR>";
      mode = "n";
    }
  ];
}
