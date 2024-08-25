{
  pkgs,
  config,
  hostname,
  ...
}:
let
  # wallpaper = ./kgw5.png;
  wallpaper = pkgs.fetchurl {
    url = "https://e7.pngegg.com/pngimages/107/930/png-clipart-kanagawa-prefecture-the-great-wave-off-kanagawa-thirty-six-views-of-mount-fuji-ukiyo-e-harbor-seal-winter-animals.png";
    # hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    sha256 = "0arhy5nc8c1zbp8payq6qm68z9jl52y5jcvi7dnpjk080jsb526b";
  };
  # scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
  # scheme = "${pkgs.base16-schemes}/share/themes/flat.yaml"; # so bad comment color
  scheme = "${pkgs.base16-schemes}/share/themes/darktooth.yaml";
  # darktooth, flat, Hopscotch, 
  cursorSize = if hostname == "laptop" then 18 else 14;
in
{
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = scheme;
    image = wallpaper;
    polarity = "dark";

    opacity = {
      applications = 0.9;
      terminal = 0.9;
      popups = 0.8;
      desktop = 0.9;
    };
    cursor = {
      name = "Vimix-cursors";
      package = pkgs.vimix-cursors;
      size = cursorSize;
    };

    fonts = {
      sizes = {
        applications = 14;
        terminal = 13;
        popups = 14;
        desktop = 14;
      };

      serif = {
        package = (pkgs.nerdfonts.override { fonts = [ "FiraMono" ]; });
        name = "FiraMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.fira-sans;
        name = "FiraSans";
      };

      monospace = {
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

      # emoji = config.stylix.fonts.serif;
    };
  };
}
