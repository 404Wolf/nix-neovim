{
  plugins.virt-column = {
    enable = true;
    settings = {
      exclude = {
        filetypes = [
          "lspinfo"
          "packer"
          "checkhealth"
          "help"
          "man"
          "TelescopePrompt"
          "TelescopeResults"
        ];
        buftypes = [
          "nofile"
          "quickfix"
          "terminal"
          "prompt"
        ];
      };
    };
  };
}
