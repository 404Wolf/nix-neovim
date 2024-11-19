{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        javascript = ["prettierd" "prettier" {stop_after_first = true;}];
        typescript = ["prettierd" "prettier" {stop_after_first = true;}];
        lua = ["stylua"];
        python = ["black" "isort"];
        css = ["prettierd"];
        json = ["prettierd"];
        yaml = ["prettierd"];
        nix = ["nix fmt" "alejandra" {stop_after_first = true;}];
        go = ["goimports" "gofmt"];
        bash = ["beautysh"];
        sh = ["beautysh"];
        rust = ["rustfmt"];
        tex = ["latexindent"];
        c = ["clang-format"];
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>pp";
      action = ":Format <CR>";
      options = {desc = "Format document";};
    }
  ];
  extraConfigLua =
    /*
    lua
    */
    ''
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })

      require("conform").formatters.shfmt = {
        prepend_args = { "--filetypes", "vue", "cc", "scss", "html", "yaml", "markdown", "markdownmdx", "graphql", "handlebars" },
        -- The base args are { "-filename", "$FILENAME" } so the final args will be
        -- { "-i", "2", "-filename", "$FILENAME" }
      }
    '';
}
