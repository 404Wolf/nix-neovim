let
  inputs = {
    program.__raw = ''
      function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end'';
    args.__raw = ''
      function()
        return vim.split(vim.fn.input('Arguments: '), " ")
      end
    '';
  };
in {
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
    ({
        name = "Launch";
        type = "lldb";
        request = "launch";
        cwd = "\${workspaceFolder}";
        stopOnEntry = false;
      }
      // inputs)
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
    ({
        name = "Select and attach to process";
        type = "gdb";
        request = "attach";
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
      // inputs)
    ({
        name = "Attach to gdbserver :1234";
        type = "gdb";
        request = "attach";
        target = "localhost:1234";
        cwd = "\${workspaceFolder}";
      }
      // inputs)
  ];
}
