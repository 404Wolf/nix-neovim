{ lib, ... }:
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

    # go to next/previous tab
    {
      key = "gt";
      action = ":tabnext<CR>";
      mode = "n";
    }

    {
      key = "gT";
      action = ":tabprevious<CR>";
      mode = "n";
    }

    # make a new tab / close current tab
    {
      key = "tn";
      action = ":tabnew<CR>";
      mode = "n";
    }

    {
      key = "tc";
      action = ":tabclose<CR>";
      mode = "n";
    }

  ]
  ++
    # go between tab 1-9
    (lib.lists.map (i: {
      key = "t" + toString i;
      action = ":tabnext " + toString i + "<CR>";
      mode = "n";
    }) (lib.lists.range 1 9))
  ++ [

    # close all buffers and exit (ctrl+q)
    {
      key = "<C-q>";
      action = ":bufdo bd<CR>";
      mode = "n";
    }
  ];
}
