{pkgs}:
with pkgs; [
  ltex-ls
  nodePackages.prettier
  luajitPackages.lua-lsp
  llvmPackages_19.clang-tools
  lua-language-server
  pyright
  typst-lsp
  typstfmt
  luarocks-nix
  stylua
  prettierd
  nixfmt-rfc-style
  black # Python formatter
  isort # Python import sorter
  go_1_21 # Go formatter
  nodePackages_latest.bash-language-server
  yaml-language-server
  vscode-langservers-extracted
  gosimports
  typescript
  beautysh
  rustc
  cargo
  rust-analyzer
  rustfmt
  taplo
  pandoc
  tree-sitter
  texlab
  nil
  alejandra
  jdt-language-server
  (symlinkJoin {
    name = "latex-indent";
    paths = [pkgs.perl538Packages.LatexIndent];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      ln -s $out/bin/latexindent.pl $out/bin/latexindent
    '';
  })
]
