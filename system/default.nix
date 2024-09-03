{
  lib,
  platform ? null,
  stateVersion ? null,

  systemModules,
  commonModules,
  # overlayModules,
  # customPkgs,
  hostConfigurationPath,
  hostConfigurationPathExist,
  hostModulesPath,
  hostModulesPathExist,
  ...
}:
{
  imports =
    [
      "${systemModules}"
      "${commonModules}"
    ]
    ++ lib.optional hostConfigurationPathExist hostConfigurationPath
    ++ lib.optional hostModulesPathExist hostModulesPath;

  module.nix-config.enable = true;
  system = {
    inherit stateVersion;
  };
  nixpkgs.hostPlatform = platform;
}
