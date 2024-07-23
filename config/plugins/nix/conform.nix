{
  plugins.conform-nvim = {
    enable = true;
    formattersByFt = {
      javascript = [ "prettierd" "prettier" {stop_after_first = true;} ];
      typescript = [ "prettierd" "prettier" {stop_after_first = true;} ];
      lua = [ "stylua" ];
      css = [ "prettierd" ];
      json = [ "prettierd" ];
      yaml = [ "prettierd" ];
      nix = [ "alejandra" ];
      go = [ "goimports" "gofmt" ];
      bash = [ "beautysh" ];
      sh = [ "beautysh" ];
      rust = [ "rustfmt" ];
      tex = [ "latexindent" ];
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>pp";
      action = ":Format <CR>";
      options = {desc = "Format document";};
    }
  ];
}
