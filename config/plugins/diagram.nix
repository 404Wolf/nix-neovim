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

      renderer_options = {
        mermaid = {
          theme = "forest";
          scale = 1;
        };
      };

      integrations = [
        {
          __raw = # lua
            ''
              (function()
                local integration = require('diagram.integrations.markdown')
                integration.filetypes = { "markdown", "quarto" }
                return integration
              end)()
            '';
        }
      ];
    };
  };

  extraConfigLuaPost = # lua
    '''';

  extraPackages = with pkgs; [
    mermaid-cli
  ];
}
