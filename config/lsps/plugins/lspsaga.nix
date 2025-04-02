{
  plugins.lspsaga = {
    enable = true;
    beacon = {
      enable = true;
    };
    ui = {
      border = "rounded"; # {none, single, double, rounded, solid, shadow}
      codeAction = "💡"; # Can be any symbol you want 💡
    };
    hover = {
      enable = true;
      openCmd = "!floorp"; # Choose your browser
      openLink = "gx";
    };
    diagnostic = {
      borderFollow = true;
      diagnosticOnlyCurrent = false;
      showCodeAction = true;
    };
    symbolInWinbar = {
      enable = true; # Breadcrumbs
    };
    codeAction = {
      extendGitSigns = false;
      showServerName = true;
      onlyInCursor = true;
      numShortcut = true;
      keys = {
        exec = "<CR>";
        quit = ["<Esc>" "q"];
      };
    };
    lightbulb = {
      enable = false;
      sign = false;
      virtualText = false;
    };
    implement = {
      enable = false;
    };
    rename = {
      keys = {
        exec = "<CR>";
        quit = ["<C-k>" "<Esc>"];
        select = "x";
      };
    };
    outline = {
      autoClose = false;
      autoPreview = true;
      closeAfterJump = false;
      layout = "normal"; # normal or float
      winPosition = "left"; # left or right
      keys = {
        jump = "e";
        quit = "q";
        toggleOrJump = "o";
      };
    };
    scrollPreview = {
      scrollDown = "<C-f>";
      scrollUp = "<C-b>";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gnr";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        desc = "Rename";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "gld";
      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "[d";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = {
        desc = "Next Diagnostic";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "]d";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = {
        desc = "Previous Diagnostic";
        silent = true;
      };
    }
  ];
}
