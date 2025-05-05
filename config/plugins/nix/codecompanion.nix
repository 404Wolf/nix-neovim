{
  plugins.codecompanion = {
    enable = true;

    settings = {
      display = {
        provider = "telescope";

        inline = {layout = "buffer";};

        action_palette = {
          width = 95;
          height = 10;
          prompt = "Prompt ";
          provider = "telescope";
          opts = {
            show_default_actions = true;
            show_default_prompt_library = true;
          };
        };
      };

      strategies = {
        chat.adapter = "anthropic";
        inline.adapter = "anthropic";
      };
    };
  };
}
