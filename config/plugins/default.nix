{pkgs, ...}: {
  imports = [
    ./nix/indent-blankline.nix
    ./nix/telescope.nix
    ./nix/coq.nix
    ./nix/chadtree.nix
    ./nix/treesitter.nix
    ./nix/barbar.nix
    ./nix/conform.nix
    ./nix/autopairs.nix
    ./nix/virt-column.nix
    ./nix/auto-save.nix
    ./nix/gitsigns.nix
    ./nix/copilot-lua.nix
    ./nix/dap.nix
    ./nix/fugitive.nix
    ./nix/dressing.nix
    ./nix/gitconflict.nix
  ];
  luaLoader.enable = true;
  plugins = {
    # Dashboard
    alpha = {
      enable = true;
      theme = "dashboard";
      iconsEnabled = true;
    };
    oil = {
      enable = true;
    };
    ts-autotag = {
      enable = true;
    };
  };
  extraPlugins = [
    pkgs.vimPlugins.onedarkpro-nvim
    pkgs.vimPlugins.actions-preview-nvim
    pkgs.vimPlugins.lualine-nvim
    pkgs.vimPlugins.aerial-nvim
    (pkgs.vimUtils.buildVimPlugin {
      pname = "nvim-lsp-file-operations";
      version = "2024-07-23";
      src = pkgs.fetchFromGitHub {
        owner = "antosha417";
        repo = "nvim-lsp-file-operations";
        rev = "92a673de7ecaa157dd230d0128def10beb56d103";
        sha256 = "sha256-FeqmybXQeZUHv/td2QTLxUZeWSblRhDqwDx9ih0A5DM=";
        meta.homepage = "https://github.com/antosha417/nvim-lsp-file-operations";
      };
    })
  ];
  extraConfigLuaPost = (
    toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
      ./lua/aerial.lua
    ])
    +
    #lua
    ''vim.cmd(":AerialOpen")''
  );
  extraConfigLua =
    # lua
    ''
      -- Function to close the initial unnamed buffer
      local function close_initial_buffer()
          if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
              vim.cmd('silent! bd! 1')
          end
      end

      -- Autocommand to trigger the function on BufEnter
      vim.api.nvim_create_autocmd("BufEnter", {
          pattern = "*",
          callback = close_initial_buffer
      })
    '';
}
