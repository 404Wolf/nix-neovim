{pkgs, ...}: {
  imports = [
    ./nix/indent-blankline.nix
    ./nix/nix-develop.nix
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
    ./nix/comment.nix
    ./nix/fugitive.nix
    ./nix/dressing.nix
    ./nix/gitconflict.nix
    ./nix/ts-autotag.nix
    ./nix/marks.nix
    ./nix/alpha.nix
  ];
  luaLoader.enable = true;
  extraPlugins = [
    pkgs.vimPlugins.nvim-jdtls
    pkgs.vimPlugins.onedarkpro-nvim
    pkgs.vimPlugins.actions-preview-nvim
    pkgs.vimPlugins.lualine-nvim
    pkgs.vimPlugins.aerial-nvim
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-lspimport";
      version = "2024-07-23";
      src = pkgs.fetchFromGitHub {
        owner = "stevanmilic";
        repo = "nvim-lspimport";
        rev = "4fef458b8853b1b90b55054ed6c3f98fff094cd1";
        sha256 = "sha256-JIbd4ygOGuNsg6fZnlN9iz7hfN4LQWM6VSJy4Qh9LJg=";
        meta.homepage = "https://github.com/stevanmilic/nvim-lspimport";
      };
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "copilot-status";
      version = "2024-07-23";
      src = pkgs.fetchFromGitHub {
        owner = "jonahgoldwastaken";
        repo = "copilot-status.nvim";
        rev = "decbffa57732f3d257641aea1d5541dd4fe536f6";
        sha256 = "sha256-jJqbMuTjTN2n7s2iXAoxJDKiRCFkBdpJEHap5KphKbM=";
        meta.homepage = "https://github.com/jonahgoldwastaken/copilot-status.nvim";
      };
    })
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
    (pkgs.vimUtils.buildVimPlugin {
      name = "telescope-git-file-history";
      version = "2024-08-04";
      src = pkgs.fetchFromGitHub {
        owner = "isak102";
        repo = "telescope-git-file-history.nvim";
        rev = "f94fab1d5a51fa28dd95b1a6bd377505dc1a8e82";
        sha256 = "sha256-7cVmZaseWntB339DSB4sNKIMQkwkhLPBYEuLlVg0J28=";
        meta.homepage = "https://github.com/isak102/telescope-git-file-history.nvim";
      };
    })
  ];
  extraConfigLuaPost = ''
    ${toString (builtins.map (f: "${builtins.readFile f}\n") [
      ./lua/actions-preview.lua
      ./lua/lualine.lua
      ./lua/aerial.lua
      # ./lua/jdtls.lua
    ])}
  '';
}
