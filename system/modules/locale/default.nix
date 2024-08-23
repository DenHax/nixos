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
      supportedLocales = unique (
        builtins.map
          (
            l:
            (replaceStrings
              [
                "utf8"
                "utf-8"
                "UTF8"
              ]
              [
                "UTF-8"
                "UTF-8"
                "UTF-8"
              ]
              l
            )
            + "/UTF-8"
          )
          (
            [
              "C.UTF-8"
              "ru_RU.UTF-8"
              "en_US.UTF-8"
              config.i18n.defaultLocale
            ]
            ++ (attrValues (filterAttrs (n: v: n != "LANGUAGE") config.i18n.extraLocaleSettings))
          )
      );
      extraLocaleSettings = {
        # LANGUAGE = "ru_RU.UTF-8";
      };
    };
  };
}
