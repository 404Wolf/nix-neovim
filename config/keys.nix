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
      key = "<C-j>";
      action = "<C-w>j";
      options = { };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = { };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = { };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = { };
    }

    # Stay selected after indent
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        noremap = true;
        desc = "Stay selected after indent left";
      };
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        noremap = true;
        desc = "Stay selected after indent right";
      };
    }

    # Select all
    {
      mode = "n";
      key = "<leader>aa";
      action = "ggVG";
      options = {
        desc = "Select all text";
      };
    }

    # Folding
    {
      mode = "n";
      key = "zt";
      action = "za";
      options = {desc = "Toggle fold at cursor";};
    }

    {
      mode = "n";
      key = "zc";
      action = ":lua vim.wo.foldlevel = vim.wo.foldlevel - 1<CR>";
      options = {desc = "Close fold at cursor";};
    }

    {
      mode = "n";
      key = "zo";
      action = ":lua vim.wo.foldlevel = vim.wo.foldlevel + 1<CR>";
      options = {desc = "Open fold at cursor";};
    }

    # Window sizing
    {
      mode = "n";
      key = "<C-m>";
      action = ":only<CR>";
      options = {desc = "Maximize current window";};
    }

    {
      mode = "n";
      key = "<C-;>";
      action = ":.s/$/;/<CR>";
      options = {desc = "Add semicolon at end of line";};
    }

    {
      mode = "n";
      key = "<leader><leader>";
      action = ":";
      options = {
        noremap = true;
        silent = false;
        desc = "Quick command access";
      };
    }

    {
      mode = "n";
      key = "<C-q>";
      action = ":wqa!<CR>";
      options = {
        noremap = true;
        silent = false;
        desc = "Save all and exit";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Page down keeping cursor centered";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Page up keeping cursor centered";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Find next while keeping the cursor centered";
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Find previous while keeping the cursor centered";
      };
    }

    {
      mode = "n";
      key = "<Leader>sv";
      action = ":vsplit<CR>";
      options = {
        desc = "Split window vertically";
      };
    }

    {
      mode = "n";
      key = "<Leader>sh";
      action = ":split<CR>";
      options = {
        desc = "Split window horizontally";
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Move cursor down in split window";
      };
    }

    {
      mode = "n";
      key = "<Leader>hh";
      action = ":vertical resize +${toString resize_amount}<CR>";
      options = {
        desc = "Increase split width";
      };
    }

    {
      mode = "n";
      key = "<Leader>ll";
      action = ":vertical resize -${toString resize_amount}<CR>";
      options = {
        desc = "Decrease split width";
      };
    }

    {
      mode = "n";
      key = "<Leader>kk";
      action = ":resize -${toString resize_amount}<CR>";
      options = {
        desc = "Decrease split height";
      };
    }

    {
      mode = "n";
      key = "<Leader>jj";
      action = ":resize +${toString resize_amount}<CR>";
      options = {
        desc = "Increase split height";
      };
    }

    {
      mode = "n";
      key = "<C-m>";
      action = "<cmd>AerialToggle<CR>";
      options = {
        noremap = false;
        silent = true;
        desc = "Toggle Aerial";
      };
    }

    {
      mode = "n";
      key = "<Leader>as";
      action = ":ASToggle<CR>";
      options = {
        desc = "Toggle AutoSave";
      };
    }

    {
      mode = "n";
      key = "<C-/>";
      action = "gc";
      options = {
        desc = "Comment/Uncomment Selection";
      };
    }

    {
      mode = "n";
      key = "<C-n>";
      action = ":CHADopen<CR>";
      options = {
        desc = "Open CHADtree";
      };
    }

    {
      mode = "n";
      key = "gd";
      action = ":lua vim.lsp.buf.definition()<CR>";
      options = {
        desc = "Go to Definition";
      };
    }

    {
      mode = "n";
      key = "gld";
      action = ":lua vim.diagnostic.open_float(nil, { focusable = false })<CR>";
      options = {
        desc = "Open diagnostic float";
      };
    }

    {
      mode = "n";
      key = "grn";
      action = ":lua vim.lsp.buf.rename()<CR>";
      options = {
        desc = "Rename using LSP";
      };
    }

    {
      mode = "n";
      key = "gra";
      action = ":lua require('actions-preview').code_actions()<CR>";
      options = {
        desc = "Preview code actions";
      };
    }

    {
      mode = "n";
      key = "grr";
      action = ":lua vim.lsp.buf.references()<CR>";
      options = {
        desc = "List all references";
      };
    }

    {
      mode = "n";
      key = "grs";
      action = ":lua vim.lsp.buf.signature_help()<CR>";
      options = {
        desc = "Show signature help";
      };
    }

    {
      mode = "i";
      key = "<C-Space>";
      action = "coq#complete()";
      options = {
        noremap = true;
        silent = true;
        expr = true;
        desc = "Trigger autocomplete";
      };
    }

  ];
  extraConfigLua =
    # lua
    ''
      function ToggleRelativeLineNumber()
        if vim.wo.relativenumber then
          vim.wo.relativenumber = false
        else
          vim.wo.relativenumber = true
          vim.wo.number = false
        end
      end

      function ToggleWrap()
        vim.wo.wrap = not vim.wo.wrap
      end
    '';
}
