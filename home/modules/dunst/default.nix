{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.dunst;
in
{
  options = {
    module.dunst.enable = mkEnableOption "Enables dunst";
  };

  config = mkIf cfg.enable {
    services.dunst =
      let
        iconGtk = config.gtk.iconTheme;
      in
      {
        enable = false;
        iconTheme = {
          name = iconGtk.name;
          package = iconGtk.package;
        };
      };
  };
}
