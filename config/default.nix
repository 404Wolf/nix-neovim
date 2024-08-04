{pkgs, ...}: {
  imports = [
    ./plugins
    ./keys.nix
    ./lsps
  ];
  colorscheme = "onedark_dark";
  extraPackages = [
    pkgs.alejandra
    pkgs.typescript
    pkgs.jdk
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
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")

      -- Function to adjust window size
      local function AdjustWindowSize(filetype, width)
        -- Resize all windows equally
        vim.cmd("wincmd =")

        -- Iterate through all windows
        for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
          local buf = vim.api.nvim_win_get_buf(win)
          local win_filetype = vim.bo[buf].filetype

          if win_filetype == filetype then
            vim.api.nvim_win_set_width(win, width)
          end
        end
      end
    '';
}
