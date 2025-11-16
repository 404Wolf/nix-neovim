{ pkgs, ... }:
{
  imports = [
    ./lsp.nix
    ./keymaps.nix
    ./plugins
  ];

  colorscheme = "onedark_dark";

  extraPackages = with pkgs; [
    ripgrep
    pandoc
    jdk
    gawk
    nix
    yazi
    mdx-language-server
  ];

  luaLoader.enable = true;

  opts = {
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    relativenumber = true;
    number = true;
    colorcolumn = "80,90,100";
    list = true;
    listchars = "space:⋅";
    foldmethod = "indent";
    foldenable = false;
    exrc = true;
    cmdheight = 0;
    winborder = "rounded";
  };

  globals = {
    mapleader = " ";
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };
}
