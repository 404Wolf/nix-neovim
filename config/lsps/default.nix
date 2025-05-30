{...}: {
  imports = [
    ./plugins/fidget.nix
    ./plugins/lspkind.nix
    ./plugins/lspsaga.nix
  ];
  plugins = {
    clangd-extensions.enable = true;

    lsp = {
      enable = true;
      keymaps = import ./keys.nix;
      capabilities =
        # lua
        ''
          vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("coq").lsp_ensure_capabilities({})
          )
        '';

      postConfig =
        # lua
        ''
          -- I do the lsp config with lua because I want my lsps to be treated
          -- as fallbacks. I want the packages to be provided by a append to the
          -- path.
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
            float={border=_border},
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          };

          require('lspconfig.ui.windows').default_options = {
            border = _border
          }
        '';
    };
  };
}
