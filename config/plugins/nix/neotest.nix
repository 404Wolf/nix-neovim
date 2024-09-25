{pkgs, ...}: {
  plugins.neotest = {
    enable = true;

    settings = {
      adapters = [
        "require('neotest-python')"
        "require('neotest-go')"
      ];
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    neotest-python
    neotest-go
  ];
}
