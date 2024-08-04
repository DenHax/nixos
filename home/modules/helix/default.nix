{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.helix;
in
{
  options = {
    module.helix.enable = mkEnableOption "Enables helix";
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      extraPackages =
        let
          # hasEditor = true;
          importPkgs = import ../editor_pkgs.nix { inherit pkgs; };
        in
        [ ] ++ importPkgs;
      settings = {
        theme = "horizon-dark";
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          language-servers = [ "nil_ls" ];
        }
      ];
      themes = { };
    };
  };
}
