{pkgs, ...}: {
  imports = [
    ./plugins
    ./keys.nix
    ./lsps
  ];
  colorscheme = "onedark_dark";
  extraPackages = with pkgs; [
    ripgrep
    pandoc
    jdk
    gawk
    nix
  ];
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
    colorcolumn = "80,90,100";
  };

  extraConfigLua =
    # lua
    ''
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.foldmethod=indent
      vim.opt.foldenable = false
    '';
}
