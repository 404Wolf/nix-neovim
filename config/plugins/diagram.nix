{ pkgs, ... }:
{
  plugins.diagram = {
    enable = true;
  };

  extraPackages = with pkgs; [
    mermaid-cli
  ];
}
