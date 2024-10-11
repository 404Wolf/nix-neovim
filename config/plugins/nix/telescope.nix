{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {enable = true;};
      fzf-native = {enable = true;};
    };
    settings = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "Grep (root dir)";
        };
      };
      "<leader>fci" = {
        action = "lsp_incoming_calls";
        options = {
          desc = "View all incoming calls for the symbol hovered";
        };
      };
      "<leader>fr" = {
        action = "lsp_references";
        options = {
          desc = "View references to the hovered symbol";
        };
      };
      "<leader>fi" = {
        action = "lsp_implementations";
        options = {
          desc = "View implementations for the hovered symbol";
        };
      };
      "<leader>fo" = {
        action = "lsp_document_symbols";
        options = {
          desc = "View references to the hovered symbol";
        };
      };
      "<leader>fd" = {
        action = "diagnostics";
        options = {
          desc = "View LSP diagnostics for the current file";
        };
      };
      "<leader>fsh" = {
        action = "command_history";
        options = {
          desc = "Command History";
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "+buffer";
        };
      };
      "<leader>fR" = {
        action = "resume";
        options = {
          desc = "Resume";
        };
      };
      "<leader>fcg" = {
        action = "git_commits";
        options = {
          desc = "Commits";
        };
      };
      "<leader>fhh" = {
        action = "git_file_history";
        options = {
          desc = "File history";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope file_browser<cr>";
      options = {
        desc = "File browser";
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
      options = {
        desc = "File browser";
      };
    }
    {
      key = "<a-o>";
      action = ":Telescope lsp_workspace_symbols query=";
      options = {
        desc = "View references to the hovered symbol";
      };
    }
  ];

  extraConfigLua = ''
    local gfh_actions = require("telescope").extensions.git_file_history.actions
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        git_file_history = {
          -- Keymaps inside the picker
          mappings = {
            i = {
              ["<C-g>"] = gfh_actions.open_in_browser,
            },
            n = {
              ["<C-g>"] = gfh_actions.open_in_browser,
            },
          },
          -- The command to use for opening the browser (nil or string)
          -- If nil, it will check if xdg-open, open, start, wslview are available, in that order.
          browser_command = nil,
        },
      },
    }
    require("telescope").load_extension("git_file_history")
  '';
}
