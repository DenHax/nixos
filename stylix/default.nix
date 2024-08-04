{ pkgs, config, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    image = ./kgw5.png;
    polarity = "dark";

    opacity = {
      applications = 0.9;
      terminal = 0.77;
      popups = 0.8;
      desktop = 0.99;
    };

    fonts = {
      sizes = {
        applications = 14;
        terminal = 12;
        popups = 14;
        desktop = 14;
      };

      serif = {
        package = (
          pkgs.nerdfonts.override {
            fonts = [
              "FiraCode"
              "NerdFontsSymbolsOnly"
            ];
          }
        );
        name = "FiraCode Nerd Font";
      };

      sansSerif = config.stylix.fonts.serif;

      monospace = {
        package = config.stylix.fonts.serif.package;
        name = "FiraCode Nerd Font Mono";
      };

      emoji = config.stylix.fonts.serif;
    };
  };
}
