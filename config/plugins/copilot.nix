{
  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = false; # turn off regular completions
      };
      nes = {
        enabled = true;
        keymap = {
          accept = "<M-l>";
          dismiss = "<Esc>";
        };
      };
    };
  };
}
