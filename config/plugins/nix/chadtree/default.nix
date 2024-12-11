{pkgs, ...}: {
  plugins.chadtree = {
    enable = true;
    package = pkgs.vimPlugins.chadtree.overrideAttrs (prev: {
      patches = [./think-in-venv.patch];
    });
  };
  extraConfigLua =
    # lua
    ''
      chadtree_settings = {
        view = {
          width = 28,
          open_direction = "right",
        },
      }
      vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
    '';
}
