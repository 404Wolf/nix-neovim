{pkgs, ...}: {
  plugins.chadtree = {
    enable = true;
    view.openDirection = "right";
    view.width = 30;
    theme = {
      textColourSet = "env";
    };
  };
}
