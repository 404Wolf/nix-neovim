{pkgs, ...}: {
  imports = [
    ./plugins/fidget.nix
    ./plugins/lspkind.nix
    ./plugins/lspsaga.nix
    ./plugins/typescript-tools.nix
  ];
  plugins = {
    lsp-format = {enable = true;};
    # lsp-lines = {enable = true;};
    lsp = {
      enable = true;
      # preConfig =
      #   #lua
      #   ''
      #     require'lspconfig'.basedpyright.setup{}
      #   '';
      servers = {
        # Webdev LSPs
        eslint = {enable = true;};
        html = {enable = true;};
        tailwindcss = {enable = true;};
        dockerls = {enable = true;};
        phpactor = {enable = true;};
        svelte = {enable = true;};
        jsonls = {enable = true;};
        nginx-language-server = {enable = true;};

        # General LSPs
        lua-ls = {enable = true;};
        julials = {enable = true;};
        lemminx = {enable = true;};
        java-language-server = {enable = true;};
        pyright = {enable = true;};
        gopls = {enable = true;};
        terraformls = {enable = true;};
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  # kubernetes = "'*.yaml";
                  "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
                  "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
                  "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
                  "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
                  "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
                };
              };
            };
          };
        };
        bashls = {enable = true;};
        rust-analyzer = {
          installRustc = true;
          installCargo = true;
          enable = true;
        };

        # Typesetting LSPs
        taplo = {enable = true;};
        marksman = {enable = true;};
        texlab = {enable = true;};
        typst-lsp = {enable = true;};

        # Nix stands alone
        nil-ls = {enable = true;};
        # nixd = {enable = true;};
      };
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
