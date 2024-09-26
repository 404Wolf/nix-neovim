{pkgs, ...}: {
  plugins.neotest = {
    enable = true;

    settings = {
      adapters = [
        "require('neotest-python')"
        "require('neotest-go')"
      ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    neotest-python
    neotest-go
  ];

  keymaps = [
    {
      key = "<Leader>tnr";
      action = "require'neotest'.run()";
      mode = "n";
      options = {
        noremap = true;
      };
    }
    {
      key = "<Leader>tnd";
      action = "require'neotest'.run.run({strategy = 'dap'})";
      mode = "n";
      options = {
        noremap = true;
      };
    }
    {
      key = "<Leader>tnd";
      action = "require'neotest'.run.run({strategy = 'dap'})";
      mode = "n";
      options = {
        noremap = true;
      };
    }
    {
      key = "<C-p>";
      action = "require'dapui'.toggle()";
      mode = "n";
      options = {
        noremap = true;
      };
    }
  ];
}
