{
  pkgs,
  inputs,
  ...
}: {
  executables = {
    gdb = {
      command = "${pkgs.gdb}/bin/gdp";
      args = ["--interpreter=dap" "--eval-command" "set print pretty on"];
    };
    lldb = {
      command = "${pkgs.lldb_17}/bin/lldb-vscode";
    };
  };
  servers = {
    pwa-node = {
      host = "localhost";
      port = "\${port}";
      executable = {
        command = "${pkgs.node}/bin/node";
        args = ["${inputs.jsdebug}/src/dapDebugServer.ts" "\${port}"];
      };
    };
  };
}
