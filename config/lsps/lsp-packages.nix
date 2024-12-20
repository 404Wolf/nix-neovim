{pkgs}:
with pkgs; let
  latex-indent = symlinkJoin {
    name = "latex-indent";
    paths = [pkgs.perl538Packages.LatexIndent];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      ln -s $out/bin/latexindent.pl $out/bin/latexindent
    '';
  };
in
  [
    alejandra
    beautysh
    black
    cargo
    delve
    go
    gopls
    gosimports
    isort
    jdt-language-server
    llvmPackages_19.clang-tools
    ltex-ls
    lua-language-server
    luajitPackages.lua-lsp
    luarocks-nix
    nil
    nodePackages.prettier
    nodePackages_latest.bash-language-server
    nufmt
    nushell
  ]
  ++ [
    pandoc
    prettierd
    pyright
    rust-analyzer
    rustc
    rustfmt
    stylua
    latex-indent
    taplo
    texlab
    tinymist
    tree-sitter
    typescript
    typstyle
    vscode-langservers-extracted
    yaml-language-server
  ]
