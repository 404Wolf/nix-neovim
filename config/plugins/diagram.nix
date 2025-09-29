{ pkgs, ... }:
{
  plugins.image.enable = true;

  plugins.diagram = {
    enable = true;
    settings = {
      events = {
        render_buffer = [
          "InsertLeave"
          "BufWinEnter"
          "TextChanged"
        ];
        clear_buffer = [ "BufLeave" ];
      };

      integrations = [
        "require('diagram.integrations.markdown')"
      ];

      renderer_options = {
        mermaid = {
          theme = "forest";
          scale = 1;
        };
      };

      keys = [
        {
          key = "K";
          fn = "function() require('diagram').show_diagram_hover() end";
          mode = "n";
          ft = [
            "markdown"
            "quarto"
          ];
          desc = "Show diagram in new tab";
        }
      ];
    };
  };

  extraPackages = with pkgs; [
    mermaid-cli
    plantuml
    gnuplot
    d2
  ];
}
