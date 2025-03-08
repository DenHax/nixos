{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.xdg;
in
{
  options = {
    module.xdg.enable = mkEnableOption "Enables xdg";
  };

  config = mkIf cfg.enable {
    xdg = {
      mimeApps = {
        enable = true;
        defaultApplications = {
          "x-scheme-handler/mailto" = "userapp-Thunderbird-A8K222.desktop";
          "x-scheme-handler/mid" = "userapp-Thunderbird-A8K222.desktop";
          "message/rfc822" = "userapp-Thunderbird-A8K222.desktop";

          "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
          "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";

          "text/markdown" = "nvim.desktop";
          "text/plain" = "nvim.desktop";

          "text/html" = "firefox.desktop";
          "x-scheme-handler/http" = "firefox.desktop";
          "x-scheme-handler/https" = "firefox.desktop";
          "x-scheme-handler/about" = "firefox.desktop";
          "x-scheme-handler/unknown" = "firefox.desktop";

          "application/pdf" = "org.pwmt.zathura.desktop";
          "inode/directory" = "thunar.dektop";
        };
      };
      desktopEntries = {
        # "feh.desktop" = {
        #
        # };
      };
    };
  };
}
