{
  plugins.codecompanion = {
    enable = true;

    settings = {
      inline.enable = true;
      model = "openai:gpt-4o";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-S-i>";
      action = "<cmd>CodeCompanionInline<cr>";
      options.desc = "CodeCompanion Inline";
    }
  ];
}
