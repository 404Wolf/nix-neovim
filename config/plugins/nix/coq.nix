{
  plugins = {
    coq-nvim = {
      enable = true;
      settings = {
        auto_start = "shut-up";
        keymap = {
          jump_to_mark = "";
        };
        clients = {
          lsp = {
            always_on_top = [];
          };
        };
      };
    };
  };
}
