{ pkgs, ... }:
{
  plugins.diagram = {
    enable = true;
  };

  extraPackages = with pkgs; [
    mmdc
  ];
}
