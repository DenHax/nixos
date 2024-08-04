{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.flameshot;
in
{
  options = {
    module.flameshot.enable = mkEnableOption "Enables flameshot";
  };

  config = mkIf cfg.enable {
    services.flameshot = {
      enable = false;
      settings = {
        General = {
          contrastOpacity = 188;
          disabledTrayIcon = true;
          drawColor = "#00ffff";
          saveAfterCopy = true;
          saveAsFileExtension = "png";
          savePath = "/home/denhax/Pictures/Screenshots";
          savePathFixed = true;
          showDesktopNotification = false;
          showHelp = false;
          showSidePanelButton = false;
          showStartupLaunchMessage = false;
        };

        Shortcuts = {
          TYPE_COPY = "Return";
          TYPE_SAVE = "";
        };
      };
    };
  };
}
