{
  keymaps =
    (builtins.genList (
      n:
      let
        tabNumber = toString (n + 1);
      in
      {
        key = "<A-${tabNumber}>";
        mode = [
          "n"
          "v"
        ];
        action = "${tabNumber}gt";
        options.desc = "Go to tab ${tabNumber}";
      }
    ) 9)
    ++ [
      {
        key = "<A-t>";
        action = "<cmd>tabnew<cr>";
      }
      {
        key = "<A-c>";
        action = "<cmd>tabclose<cr>";
      }
      {
        key = "<C-q>";
        action = "<cmd>q<cr>";
      }
    ];
}
