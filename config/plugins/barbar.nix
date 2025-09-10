{
  plugins.barbar = {
    enable = true;
  };
  keymaps =
    let
      opts = {
        noremap = false;
        silent = false;
      };
    in
    [
      {
        mode = "n";
        key = "<A-,>";
        action = "<Cmd>BufferPrevious<CR>";
        options = opts;
      }
      {
        mode = "n";
        key = "<A-.>";
        action = "<Cmd>BufferNext<CR>";
        options = opts;
      }
      {
        mode = "n";
        key = "<A-<>";
        action = "<Cmd>BufferMovePrevious<CR>";
        options = opts;
      }
      {
        mode = "n";
        key = "<A->>";
        action = "<Cmd>BufferMoveNext<CR>";
        options = opts;
      }
      {
        mode = "n";
        key = "<A-c>";
        action = "<Cmd>BufferClose<CR>";
        options = opts;
      }
    ]
    ++ builtins.map (num: {
      mode = "n";
      key = "<A-${toString num}>";
      action = "<Cmd>BufferGoto ${toString num}<CR>";
      options = {
        desc = "Go to buffer ${toString num}";
      };
    }) (builtins.genList (x: x + 1) 9);
}
