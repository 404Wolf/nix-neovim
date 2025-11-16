{
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
    };
    settings = {
      defaults = {
        layout_strategy = "horizontal";
        layout_config = {
          horizontal = {
            prompt_position = "top";
            width = 0.9;
            height = 0.6;
            preview_width = 0.5;
          };
        };
        sorting_strategy = "ascending";
      };
    };
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
      };
      "<leader>fg" = {
        action = "live_grep";
      };
      "<leader>fb" = {
        action = "buffers";
      };
      "<leader>fhh" = {
        action = "git_file_history";
      };
      "<leader>foo" = {
        action = "lsp_document_symbols";
      };
    };
  };
}
