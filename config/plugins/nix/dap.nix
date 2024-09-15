{
  plugins.dap = {
    enable = true;
    signs = {
      dapBreakpoint = {
        text = "●";
        texthl = "DapBreakpoint";
      };
      dapBreakpointCondition = {
        text = "●";
        texthl = "DapBreakpointCondition";
      };
      dapLogPoint = {
        text = "◆";
        texthl = "DapLogPoint";
      };
    };
    extensions = {
      dap-python = {
        enable = true;
      };
      dap-ui = {
        enable = true;
        floating.mappings = {
          close = ["<ESC>" "q"];
        };
      };
      dap-virtual-text = {
        enable = true;
      };
    };
    configurations = {
      java = [
        {
          type = "java";
          request = "launch";
          name = "Debug (Attach) - Remote";
          hostName = "127.0.0.1";
          port = 5005;
        }
      ];
    };
  };
  keymaps = let
    mkKeymap = key: action: {
      inherit key;
      action = "<Cmd>lua " + action + "<CR>";
      mode = "n";
      options.noremap = true;
    };
  in [
    (mkKeymap "<F5>" "require'dap'.continue()")
    (mkKeymap "<F6>" "require'dap'.step_over()")
    (mkKeymap "<F4>" "require'dap'.step_out()")
    (mkKeymap "<Leader>dbb" "require'dap'.toggle_breakpoint()")
    (mkKeymap "<Leader>dlp" "require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))")
    (mkKeymap "<Leader>dr" "require'dap'.repl.open()")
    (mkKeymap "<Leader>dl" "require'dap'.run_last()")
  ];
}
