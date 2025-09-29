{ pkgs, ... }:
{
  lsp = {
    inlayHints.enable = true;

    servers = {
      nil_ls.enable = true;
      basedpyright.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      biome.enable = true;
      superhtml.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      postgres_lsp.enable = true;
      ruby_lsp.enable = true;
      texlab.enable = true;
      tinymist.enable = true;
      tailwindcss.enable = true;
      yamlls.enable = true;
      astro = {
        enable = true;
        settings = {
          init_options = {
            typescript = {
              tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
            };
          };
        };
      };
      vue_ls.enable = true;
      jdtls.enable = true;
      rust_analyzer.enable = true;
      lua_ls.enable = true;
      ts_ls = {
        enable = true;
        settings = {
          single_file_support = false;
          filetypes = [ ];
        };
      };
      denols = {
        enable = true;
        settings = {
          root_markers = [
            "deno.json"
            "deno.jsonc"
          ];
          root_dir = {
            __raw = # lua
              ''
                function(bufnr, on_dir)
                  local util = require('lspconfig.util')
                  local deno_root = util.root_pattern('deno.json', 'deno.jsonc')(filepath)
                  if deno_root then
                    on_dir(deno_root)
                  end
                end
              '';
          };
          single_file_support = false;
        };
      };
    };

    luaConfig.content = # lua
      ''
        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        })
      '';
  };

  plugins.lspconfig.enable = true;

  keymaps = [
    {
      key = "<leader>pp";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
    }
    {
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<cr>";
    }
    {
      key = "gld";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
    }
    {
      key = "gf";
      action = "<cmd>lua vim.lsp.buf.references()<cr>";
    }
    {
      key = "gt";
      action = "<cmd>lua vim.lsp.buf.type_definition()<cr>";
    }
    {
      key = "gfci";
      action = "<cmd>lua vim.lsp.buf.incoming_calls()<cr>";
    }
    {
      key = "goci";
      action = "<cmd>lua vim.lsp.buf.outgoing_calls()<cr>";
    }
  ];
}
