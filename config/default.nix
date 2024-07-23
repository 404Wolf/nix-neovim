{
  config,
  lib,
  ...
}: {
  imports = [./plugins ./keys.nix];
  colorscheme = "onedark_dark";
  opts = let
    tab_amount = 2;
  in {
    shiftwidth = tab_amount;
    tabstop = tab_amount;
    expandtab = true;

    # Line numbering
    relativenumber = true;
    number = true;

    # Ruler at 90 characters
    colorcolumn = "79,120";
  };
}
