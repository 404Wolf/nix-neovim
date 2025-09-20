{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) return end";
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<Up>" = "cmp.mapping.select_prev_item()";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
        ];

        autocomplete = [
          "InsertEnter"
          "TextChanged"
          "TextChangedI"
          "TextChangedP"
        ];
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;

    lspconfig.enable = true;
  };
}
