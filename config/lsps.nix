{...}: {
  plugins = {
    inc-rename = {
      enable = true;
    };
    typescript-tools = {
      enable = true;
    };
    lspkind = {
      enable = true;
      symbolMap = {
        Copilot = "";
      };
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
    fidget = {
      enable = true;
      logger = {
        level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
        floatPrecision = 0.01; # Limit the number of decimals displayed for floats
      };
      progress = {
        pollRate = 0; # How and when to poll for progress messages
        suppressOnInsert = true; # Suppress new messages while in insert mode
        ignoreDoneAlready = false; # Ignore new tasks that are already complete
        ignoreEmptyMessage = false; # Ignore new tasks that don't contain a message
        clearOnDetach =
          # Clear notification group when LSP server detaches
          # lua
          ''
            function(client_id)
              local client = vim.lsp.get_client_by_id(client_id)
              return client and client.name or nil
            end
          '';
        notificationGroup =
          # How to get a progress message's notification group key
          # lua
          ''
            function(msg) return msg.lsp_client.name end
          '';
        ignore = []; # List of LSP servers to ignore
        lsp = {
          progressRingbufSize = 0; # Configure the nvim's LSP progress ring buffer size
        };
        display = {
          renderLimit = 16; # How many LSP messages to show at once
          doneTtl = 3; # How long a message should persist after completion
          doneIcon = "✔"; # Icon shown when all LSP progress tasks are complete
          doneStyle = "Constant"; # Highlight group for completed LSP tasks
          progressTtl = "math.huge"; # How long a message should persist when in progress
          progressIcon = {
            pattern = "dots";
            period = 1;
          }; # Icon shown when LSP progress tasks are in progress
          progressStyle = "WarningMsg"; # Highlight group for in-progress LSP tasks
          groupStyle = "Title"; # Highlight group for group name (LSP server name)
          iconStyle = "Question"; # Highlight group for group icons
          priority = 30; # Ordering priority for LSP notification group
          skipHistory = true; # Whether progress notifications should be omitted from history
          formatMessage =
            # lua
            ''
              require ("fidget.progress.display").default_format_message
            ''; # How to format a progress message
          formatAnnote =
            # lua
            ''
              function (msg) return msg.title end
            ''; # How to format a progress annotation
          formatGroupName =
            # lua
            ''
              function (group) return tostring (group) end
            ''; # How to format a progress notification group's name
          overrides = {
            rust_analyzer = {
              name = "rust-analyzer";
            };
          }; # Override options from the default notification config
        };
      };
      notification = {
        pollRate = 10; # How frequently to update and render notifications
        filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
        historySize = 128; # Number of removed messages to retain in history
        overrideVimNotify = true;
        redirect =
          # lua
          ''
            function(msg, level, opts)
              if opts and opts.on_open then
                return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
              end
            end
          '';
        configs = {
          default =
            # lua
            ''require('fidget.notification').default_config'';
        };

        window = {
          normalHl = "Comment";
          winblend = 0;
          border = "none"; # none, single, double, rounded, solid, shadow
          zindex = 45;
          maxWidth = 0;
          maxHeight = 0;
          xPadding = 1;
          yPadding = 0;
          align = "bottom";
          relative = "editor";
        };
        view = {
          stackUpwards = true; # Display notification items from bottom to top
          iconSeparator = " "; # Separator between group name and icon
          groupSeparator = "---"; # Separator between notification groups
          groupSeparatorHl =
            # Highlight group used for group separator
            "Comment";
        };
      };
    };
    lsp-format = {enable = true;};
    lsp-lines = {enable = true;};
    lsp = {
      enable = true;
      servers = {
        # Webdev LSPs
        eslint = {enable = true;};
        html = {enable = true;};
        tailwindcss = {enable = true;};
        dockerls = {enable = true;};
        phpactor = {enable = true;};
        svelte = {enable = true;};

        # General LSPs
        lua-ls = {enable = true;};
        pyright = {enable = true;};
        gopls = {enable = true;};
        terraformls = {enable = true;};
        yamlls = {
          enable = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
                  kubernetes = "'*.yaml";
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
        # nil-ls = {enable = true;};
        nixd = {enable = true;};
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "grn" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "gld" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "gra";
      action = ":lua require('actions-preview').code_actions()<CR>";
      options = {
        desc = "Preview code actions";
      };
    }

    {
      mode = "n";
      key = "grr";
      action = ":lua vim.lsp.buf.references()<CR>";
      options = {
        desc = "List all references";
      };
    }

    {
      mode = "n";
      key = "grs";
      action = ":lua vim.lsp.buf.signature_help()<CR>";
      options = {
        desc = "Show signature help";
      };
    }
  ];
  extraConfigLua =
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
}
