{
  lsp = {
    servers = {
      nil_ls.enable = true;
      basedpyright.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      superhtml.enable = true;
      jsonls.enable = true;
      marksman.enable = true;
      postgres_lsp.enable = true;
      ruby_lsp.enable = true;
      tinymist.enable = true;
      tailwindcss.enable = true;
      vtls.enable = true;

      denols = {
        enable = true;
        settings = {
          initOptions = {
            lint = true;
            unstable = true;
          };
          inlayHints = {
            parameterNames = {
              enabled = "all";
              suppressWhenArgumentMatchesName = true;
            };
            parameterTypes.enable = true;
            variableTypes = {
              enabled = true;
              suppressWhenTypeMatchesName = true;
            };
            propertyDeclarationTypes.enabled = true;
            functionLikeReturnTypes.enable = true;
            enumMemberValues.enabled = true;
          };
        };
      };
    };

    luaConfig.content = ''
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

       vim.lsp.inlay_hint.enable(true)
    '';
  };

  plugins.lspconfig.enable = true;

  keymaps = [
    {
      key = "<leader>pp";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
    }
  ];
}
