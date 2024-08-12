{pkgs, ...}: {
  imports = [
    ./plugins/fidget.nix
    ./plugins/lspkind.nix
    ./plugins/lspsaga.nix
    ./plugins/typescript-tools.nix
  ];
  plugins = {
    lsp-format = {enable = true;};
    lsp = {
      enable = true;
      keymaps = import ./keys.nix;
      capabilities =
        # lua
        ''
          vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            vim.lsp.protocol.make_client_capabilities(),
            -- returns configured operations if setup() was already called
            -- or default operations if not
            require("lsp-file-operations").default_capabilities()
          )
        '';
      postConfig =
        # lua
        ''
          -- I want to do the lsp config with lua because I want my lsps to be treated as fallbacks.
          -- I want the packages to be provided by a append to the path.
          ${builtins.readFile ./lsp-config.lua}

          local _border = "rounded"

          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              border = _border
            }
          )

          vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
              border = _border
            }
          )

          vim.diagnostic.config{
            float={border=_border}
          };

          require('lspconfig.ui.windows').default_options = {
            border = _border
          }
        '';
    };
  };
}
