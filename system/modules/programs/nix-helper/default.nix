{
  lib,
  config,
  username,
  ...
}:

with lib;

let
  cfg = config.module.programs.nh;
in
{
  options = {
    module.programs.nh.enable = mkEnableOption "Enable Nix Helper";
  };

  config = mkIf cfg.enable {
    programs.nh = {
      enable = true;
      flake = "/home/${username}/nix";

      clean = {
        enable = true;
        extraArgs = "--keep-since 30d --keep 10";
      };
    };
  };
}
