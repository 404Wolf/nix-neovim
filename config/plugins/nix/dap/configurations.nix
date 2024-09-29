{
  java = [
    {
      type = "java";
      request = "launch";
      name = "Debug (Attach) - Remote";
      hostName = "127.0.0.1";
      port = 5005;
    }
  ];
  cpp = [
    {
      name = "Launch";
      type = "lldb";
      request = "launch";
      program.__raw =
        #lua
        ''
          function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end
        '';
      cwd = "\${workspaceFolder}";
      stopOnEntry = false;
      args = {};
    }
  ];
  c = [
    {
      name = "Launch";
      type = "gdb";
      request = "launch";
      program =
        #lua
        ''
          function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end'';
      cwd = "\${workspaceFolder}";
      stopAtBeginningOfMainSubprogram = false;
    }
    {
      name = "Select and attach to process";
      type = "gdb";
      request = "attach";
      program =
        #lua
        ''
          function()
             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end'';
      pid =
        #lua
        ''
          function()
             local name = vim.fn.input('Executable name (filter): ')
             return require("dap.utils").pick_process({ filter = name })
          end
        '';
      cwd = "\${workspaceFolder}";
    }
    {
      name = "Attach to gdbserver :1234";
      type = "gdb";
      request = "attach";
      target = "localhost:1234";
      program.__raw =
        #lua
        ''
          function()
             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end
        '';
      cwd = "\${workspaceFolder}";
    }
  ];
}
