{pkgs, ...}: {
  imports = [
    ./plugins
    ./keys.nix
    ./lsps.nix
  ];
  colorscheme = "onedark_dark";
  extraPackages = [
    pkgs.alejandra
    pkgs.typescript
    pkgs.nodePackages.typescript-language-server
    pkgs.prettierd
    pkgs.beautysh
    pkgs.pandoc
    pkgs.black
    pkgs.isort
    pkgs.luarocks-nix
    pkgs.luajitPackages.lua-lsp
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
    colorcolumn = "79,120";
  };

  extraConfigLua =
    # lua
    ''
      vim.opt.listchars:append("space:⋅")
    '';
}
