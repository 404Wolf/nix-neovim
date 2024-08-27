{
  globals.mapleader = " ";
  keymaps = let
    resize_amount = 8;
  in [
    {
      mode = "n";
      key = "<leader>dbs";
      action = ":exe 'normal! v<-left><left>S'<CR>";
      options = {
        noremap = true;
        silent = true;
        desc = "Delete back to first nonspace";
      };
    }

    {
      mode = "n";
      key = "<c-j>";
      action = "<c-w>j";
      options = { };
    }

    {
      mode = "n";
      key = "<c-k>";
      action = "<c-w>k";
      options = { };
    }

    {
      mode = "n";
      key = "<c-h>";
      action = "<c-w>h";
      options = { };
    }

    {
      mode = "n";
      key = "<c-l>";
      action = "<c-w>l";
      options = { };
    }

    # stay selected after indent
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        noremap = true;
        desc = "stay selected after indent left";
      };
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        noremap = true;
        desc = "stay selected after indent right";
      };
    }

    # select all
    {
      mode = "n";
      key = "<leader>aa";
      action = "ggvg";
      options = {
        desc = "select all text";
      };
    }

    # folding
    {
      mode = "n";
      key = "zt";
      action = "za";
      options = {desc = "toggle fold at cursor";};
    }

    {
      mode = "n";
      key = "zc";
      action = ":lua vim.wo.foldlevel = vim.wo.foldlevel - 1<cr>";
      options = {desc = "close fold at cursor";};
    }

    {
      mode = "n";
      key = "zo";
      action = ":lua vim.wo.foldlevel = vim.wo.foldlevel + 1<cr>";
      options = {desc = "open fold at cursor";};
    }

    # window sizing
    {
      mode = "n";
      key = "<c-m>";
      action = ":only<cr>";
      options = {desc = "maximize current window";};
    }

    {
      mode = "n";
      key = "<c-;>";
      action = ":.s/$/;/<cr>";
      options = {desc = "add semicolon at end of line";};
    }

    {
      mode = "n";
      key = "<leader><leader>";
      action = ":";
      options = {
        noremap = true;
        silent = false;
        desc = "quick command access";
      };
    }

    {
      mode = "n";
      key = "<c-q>";
      action = ":wqa!<cr>";
      options = {
        noremap = true;
        silent = false;
        desc = "save all and exit";
      };
    }

    {
      mode = "n";
      key = "<c-d>";
      action = "<c-d>zz";
      options = {
        desc = "page down keeping cursor centered";
      };
    }

    {
      mode = "n";
      key = "<c-u>";
      action = "<c-u>zz";
      options = {
        desc = "page up keeping cursor centered";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "find next while keeping the cursor centered";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "find previous while keeping the cursor centered";
      };
    }

    {
      mode = "n";
      key = "<leader>sv";
      action = ":vsplit<cr>";
      options = {
        desc = "split window vertically";
      };
    }

    {
      mode = "n";
      key = "<leader>sh";
      action = ":split<cr>";
      options = {
        desc = "split window horizontally";
      };
    }

    {
      mode = "n";
      key = "<c-j>";
      action = "<c-w>j";
      options = {
        desc = "move cursor down in split window";
      };
    }

    {
      mode = "n";
      key = "<leader>hh";
      action = ":vertical resize +${toString resize_amount}<cr>";
      options = {
        desc = "increase split width";
      };
    }

    {
      mode = "n";
      key = "<leader>ll";
      action = ":vertical resize -${toString resize_amount}<cr>";
      options = {
        desc = "decrease split width";
      };
    }

    {
      mode = "n";
      key = "<leader>kk";
      action = ":resize -${toString resize_amount}<cr>";
      options = {
        desc = "decrease split height";
      };
    }

    {
      mode = "n";
      key = "<leader>jj";
      action = ":resize +${toString resize_amount}<cr>";
      options = {
        desc = "increase split height";
      };
    }

    {
      mode = "n";
      key = "<c-m>";
      action = "<cmd>AerialToggle<cr>";
      options = {
        noremap = false;
        silent = true;
        desc = "toggle aerial";
      };
    }

    {
      mode = "n";
      key = "<leader>as";
      action = ":ASToggle<cr>";
      options = {
        desc = "toggle autosave";
      };
    }

    {
      mode = "n";
      key = "<c-/>";
      action = "gc";
      options = {
        desc = "comment/uncomment selection";
      };
    }

    {
      mode = "n";
      key = "<c-n>";
      action = ":CHADopen<cr>";
      options = {
        desc = "open chadtree";
      };
    }
  ];
  extraConfigLua =
    # lua
    ''
      function toggleRelativeLineNumber()
        if vim.wo.relativenumber then
          vim.wo.relativenumber = false
        else
          vim.wo.relativenumber = true
          vim.wo.number = false
        end
      end

      function toggleWrap()
        vim.wo.wrap = not vim.wo.wrap
      end
    '';
}
