{pkgs, ...}: {
  plugins.neotest = {
    enable = true;

    settings = {
      adapters = [
        "require('neotest-python')"
        "require('neotest-go')"
        "require('neotest-jest')"
      ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    neotest-python
    neotest-jest
    neotest-go
  ];

  keymaps = let
    prefix = "<C-;>";
  in [
    # Run Test at Cursor with debug
    {
      key = "${prefix}a";
      action = ":lua require('neotest').run.run({ strategy = 'dap' })<CR>";
      options = {
        silent = true;
      };
    }

    # Run Test at Cursor
    {
      key = "${prefix}c";
      action = ":lua require('neotest').run.run({ strategy = 'dap' })<CR>";
      options = {
        silent = true;
      };
    }

    # Run Current File's Tests
    {
      key = "${prefix}f";
      action = ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = {
        silent = true;
      };
    }

    # Rerun Last Test
    {
      key = "${prefix}l";
      action = ":lua require('neotest').run.run_last()<CR>";
      options = {
        silent = true;
      };
    }

    # Peek Output
    {
      key = "${prefix}m";
      action = ":lua require('neotest').output.open()<CR>";
      options = {
        silent = true;
      };
    }

    # Refresh Tests
    {
      key = "${prefix}r";
      action = ":lua require('neotest').summary.refresh()<CR>";
      options = {
        silent = true;
      };
    }

    # Toggle Inline Coverage
    {
      key = "${prefix}i";
      action = ":lua require('neotest').coverage.toggle()<CR>";
      options = {
        silent = true;
      };
    }

    # Rerun Last Test with Coverage
    {
      key = "${prefix}L";
      action = ":lua require('neotest').run.run_last({ coverage = true })<CR>";
      options = {
        silent = true;
      };
    }

    # Debug Last Test
    {
      key = "${prefix}d";
      action = ":lua require('neotest').run.run({ strategy = 'dap' })<CR>";
      options = {
        silent = true;
      };
    }

    # Show Most Recent Test Output
    {
      key = "${prefix}o";
      action = ":lua require('neotest').output_panel.toggle()<CR>";
      options = {
        silent = true;
      };
    }

    # Show the testing UI
    {
      key = "<C-p>";
      action = ":lua require('dapui').toggle()<CR>";
      mode = "n";
      options = {
        noremap = true;
      };
    }
  ];
}
