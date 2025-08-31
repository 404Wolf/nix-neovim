{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) return end";

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
        };

        sources = [
          {name = "nvim_lsp";}
          {name = "buffer";}
          {name = "path";}
        ];

        autocomplete = ["InsertEnter" "TextChanged" "TextChangedI" "TextChangedP"];
      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;

    lspconfig.enable = true;
  };
}
