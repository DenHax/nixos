{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.wireguard;

  pname = "ZMK.Studio";
  version = "0.3.1";
  owner = "zmkfirmware";
  repo = "zmk-studio";

  src = pkgs.fetchurl {
    url = "https://github.com/${owner}/${repo}/releases/download/v${version}/${pname}_${version}_amd64.AppImage";
    hash = "sha256-kDt3AxPV1901WH3n6+mmylLwnvRrAuHSlFlRK9qEoOs=";
  };

  zmk = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
  };
in
{
  options.module = {
    zmk.enable = mkEnableOption "Enables zmk";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.appimage-run
      zmk
    ];
  };

}
