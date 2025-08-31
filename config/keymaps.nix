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
        action = "<cr>tabnew<cr>";
      }
      {
        key = "<A-c>";
        action = "<cr>tabclose<cr>";
      }
      {
        key = "<C-q>";
        action = "<cr>q<cr>";
      }
    ];
}
