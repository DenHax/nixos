{
  pkgs,
  lib,
  hostname,
  platform,
  stateVersion ? null,
  stateVersionDarwin ? null,
  ...
}:

let
  inherit (pkgs.stdenv) isDarwin;
  currentStateVersion = if isDarwin then stateVersionDarwin else stateVersion;
in
{
  imports = [
    ./modules/nix
  ] ++ lib.optional (builtins.pathExists (./. + "/host/${hostname}")) ./host/${hostname};

  module.nix-config.enable = true;
  system.stateVersion = currentStateVersion;
  nixpkgs.hostPlatform = platform;
}
