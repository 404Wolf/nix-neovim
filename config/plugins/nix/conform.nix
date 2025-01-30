{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = ["alejandra"];
        javascript = ["prettierd"];
        typescript = ["deno_fmt"];
        lua = ["stylua"];
        python = ["black" "isort"];
        typst = ["typstyle"];
        css = ["prettierd"];
        json = ["prettierd"];
        yaml = ["prettierd"];
        go = ["goimports" "gofmt"];
        bash = ["beautysh"];
        sh = ["beautysh"];
        rust = ["rustfmt"];
        tex = ["latexindent"];
        c = ["clang-format"];
        nu = ["nufmt"];
        racket = ["racket_fmt"];
      };
      default_format_opts = {
        lsp_format = "prefer";
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
    # lua
    ''
      conform = require("conform")

      conform.formatters.shfmt = {
        -- The base args are { "-filename", "$FILENAME" } so the final args will be { "-i", "2", "-filename", "$FILENAME" }
        prepend_args = { "--filetypes", "vue", "cc", "scss", "html", "yaml", "markdown", "markdownmdx", "graphql", "handlebars" },
      }

      conform.formatters.racket_fmt = {
        command = "raco",
        args = { "fmt" },
        -- stdin = false,
      }

      conform.formatters.nix_fmt = {
        command = "nix",
        args = { "fmt" },
      }

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
    '';
}
