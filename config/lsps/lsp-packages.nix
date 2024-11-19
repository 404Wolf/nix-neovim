{pkgs}:
with pkgs; [
  ltex-ls
  nodePackages.prettier
  luajitPackages.lua-lsp
  llvmPackages_19.clang-tools
  lua-language-server
  pyright
  tinymist
  typstyle
  luarocks-nix
  stylua
  nixfmt-rfc-style
  black # Python formatter
  isort # Python import sorter
  go # Go formatter
  gopls
  delve
  gosimports
  nodePackages_latest.bash-language-server
  yaml-language-server
  vscode-langservers-extracted
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
  typescript
  nodePackages.typescript-language-server
  prettierd
  beautysh
  black
  isort
  luarocks-nix
  luajitPackages.lua-lsp
  (symlinkJoin {
    name = "latex-indent";
    paths = [pkgs.perl538Packages.LatexIndent];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      ln -s $out/bin/latexindent.pl $out/bin/latexindent
    '';
  })
]
