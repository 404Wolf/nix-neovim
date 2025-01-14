{pkgs}:
with pkgs; [
  alejandra
  beautysh
  nil
  nodePackages_latest.bash-language-server
  nufmt
  nushell
  pandoc
  prettierd
  taplo
  tinymist
  vscode-langservers-extracted
  yaml-language-server
  ltex-ls
  typescript
  pyright
]
# Packages needed for LSP configurations, by language:
# texlab
# tree-sitter
# typstyle
# black
# cargo
# delve
# go
# gopls
# gosimports
# isort
# jdt-language-server
# llvmPackages_19.clang-tools
# lua-language-server
# luajitPackages.lua-lsp
# luarocks-nix
# rust-analyzer
# cargo
# rustc
# rustfmt
# stylua
# latex-indent
# nodePackages.prettier

