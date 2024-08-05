{
  # pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.gtk;
in
{
  options = {
    module.gtk.enable = mkEnableOption "Enables gtk";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      # iconTheme = {
      #   name = "Kanagawa";
      #   package = pkgs.kanagawa-icon-theme;
      # };
      # theme = {
      #   name = "Kanagawa-BL";
      #   # package = pkgs.kanagawa-gtk-theme;
      # };
      gtk4 = { };
    };
  };
}
