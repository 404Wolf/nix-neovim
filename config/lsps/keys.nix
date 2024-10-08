{
  silent = true;
  lspBuf = {
    gd = {
      action = "definition";
      desc = "Goto Definition";
    };
    gr = {
      action = "references";
      desc = "Goto References";
    };
    gi = {
      action = "implementation";
      desc = "Goto Implementation";
    };
    gt = {
      action = "type_definition";
      desc = "Type Definition";
    };
    K = {
      action = "hover";
      desc = "Hover";
    };
    "<leader>cw" = {
      action = "workspace_symbol";
      desc = "Workspace Symbol";
    };
    gra = {
      action = "code_action";
      desc = "Rename";
    };
  };
  diagnostic = {
    "gld" = {
      action = "open_float";
      desc = "Line Diagnostics";
    };
    "[d" = {
      action = "goto_next";
      desc = "Next Diagnostic";
    };
    "]d" = {
      action = "goto_prev";
      desc = "Previous Diagnostic";
    };
  };
}
