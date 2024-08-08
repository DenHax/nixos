{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.zsh;
in
{
  options = {
    module.zsh.enable = mkEnableOption "Enables zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases =
        let
          flakeDir = "~/nix";
        in
        {
          rb = "doas nixos-rebuild switch --flake ${flakeDir}";
          upd = "nix flake update ${flakeDir}";
          upg = "doas nixos-rebuild switch --upgrade --flake ${flakeDir}";
          hms = "home-manager switch --flake ${flakeDir}";

          ll = "ls -l";
          el = "eza -l";
          ea = "eza -a";
          se = "sudoedit";
          ff = "fastfetch";
          e = "eza --icons=auto";
          tree = "eza --tree --level=4 --icons=auto";
        };

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      # profileExtra = # bash
      #   ''
      #     eval '$(direnv hook zsh)'
      #   '';

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "z"
          "direnv"
          "starship"
        ];
        # agnoster, alanpeabody, amuse, bira, bureau, clean, darkblood, fino, gnzh, jonathan, mortalscumbag
        # faorites; bira ?. fino
        theme = "gnzh";
      };
    };
  };
}
