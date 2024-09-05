{
  config,
  lib,
  inputs,
  pkgs,
  platform,
  ...
}:

with lib;

let
  cfg = config.module.firefox;
in
{
  options = {
    module.firefox.enable = mkEnableOption "Enables firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      # package = pkgs.firefox-devedition;
      # policies = {
      #   DisableTelemetry = true;
      #   DisableFirefoxStudies = true;
      #   EnableTrackingProtection = {
      #     Value = true;
      #     Locked = true;
      #     Cryptomining = true;
      #     Fingerprinting = true;
      #   };
      #   DisablePocket = true;
      #   # DisableFirefoxAccounts = true;
      #   # DisableAccounts = true;
      #   # DisableFirefoxScreenshots = true;
      #   OverrideFirstRunPage = "";
      #   OverridePostUpdatePage = "";
      #   DontCheckDefaultBrowser = true;
      #   DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      #   DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      #   SearchBar = "unified"; # alternative: "separate"
      # };
      #
      # profiles.denhax = {
      #   search = {
      #     default = "DuckDuckGo";
      #     order = [
      #       "DuckDuckGo"
      #       "Google"
      #     ];
      #     privateDefault = "DuckDuckGo";
      #   };
      #
      #   settings = {
      #
      #     # Тонкие вкладки и поисковая строка
      #     "browser.uidensity" = 1;
      #
      #     #  Отключаем Pocket
      #     # "extensions.pocket.api" = "";
      #     # "extensions.pocket.enabled" = false;
      #     # "extensions.pocket.site" = "";
      #     # "extensions.pocket.oAuthConsumerKey" = "";
      #
      #     # Отключаем анимацию открытия видео на фуллскин и подсказку "нажмите esc.."
      #     "full-screen-api.transition-duration.enter" = "0";
      #     "full-screen-api.transition-duration.leave" = "0";
      #     "full-screen-api.warning.timeout" = 0;
      #
      #     # Просим сайты не отслеживать Вас
      #     # "privacy.trackingprotection.enabled" = true;
      #     "privacy.donottrackheader.enabled" = true;
      #
      #     # Отключаем телеметрию и отправку отчетов
      #     "toolkit.telemetry.archive.enabled" = false;
      #     "toolkit.telemetry.bhrPing.enabled" = false;
      #     "toolkit.telemetry.cachedClientID" = "";
      #     "toolkit.telemetry.firstShutdownPing.enabled" = false;
      #     "toolkit.telemetry.hybridContent.enabled" = false;
      #     "toolkit.telemetry.newProfilePing.enabled" = false;
      #     "toolkit.telemetry.previousBuildID" = "";
      #     "toolkit.telemetry.reportingpolicy.firstRun" = false;
      #     "toolkit.telemetry.server" = "";
      #     "toolkit.telemetry.server_owner" = "";
      #     "toolkit.telemetry.shutdownPingSender.enabled" = false;
      #     "toolkit.telemetry.unified" = false;
      #     "toolkit.telemetry.updatePing.enabled" = false;
      #     "datareporting.healthreport.infoURL" = "";
      #     "datareporting.healthreport.uploadEnabled" = false;
      #     "datareporting.policy.dataSubmissionEnabled" = false;
      #     "datareporting.policy.firstRunURL" = "";
      #     "browser.tabs.crashReporting.sendReport" = false;
      #     "browser.tabs.crashReporting.email" = false;
      #     "browser.tabs.crashReporting.emailMe" = false;
      #     "breakpad.reportURL" = "";
      #     "security.ssl.errorReporting.automatic" = false;
      #     "toolkit.crashreporter.infoURL" = "";
      #     "network.allow-experiments" = false;
      #     "dom.ipc.plugins.reportCrashURL" = false;
      #     "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
      #   };
      #   extensions = with inputs.firefox-addons.packages.${platform}; [
      #     # vim-vixen
      #     ublock-origin
      #     tridactyl
      #     darkreader
      #   ];
      # };
    };
  };
}
