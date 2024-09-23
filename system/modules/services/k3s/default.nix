{ config, lib, ... }:

with lib;

let
  cfg = config.module.service.k3s;
in
{
  options.module = {
    service.k3s.enable = mkEnableOption "Enable k3s";
  };
  config = mkIf cfg.enable {
    service.k3s = {
      enable = true;
    };
  };
}
