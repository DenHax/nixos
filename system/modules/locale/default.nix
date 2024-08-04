{ lib, config, ... }:

with lib;

let
  cfg = config.module.locale;
in
{
  options = {
    module.locale.enable = mkEnableOption "Enables locales";
  };

  config = mkIf cfg.enable {
    i18n = {
      defaultLocale = "en_US.UTF-8";
      supportedLocales = [
        "C.UTF-8"
        "ru_RU.UTF-8/UTF-8"
        "en_US.UTF-8/UTF-8"
        config.i18n.defaultLocale
      ];
      extraLocaleSettings = {
        LANGUAGE = "ru_RU.UTF-8";
      };
    };
  };
}
