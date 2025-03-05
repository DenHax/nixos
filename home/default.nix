{
  self,
  pkgs,
  lib,
  inputs,
  hostname,
  username,
  platform,
  stateVersion,
  homeModules,
  commonModules,
  overlayModules,
  customPkgs,
  isWorkstation ? false,
  wm ? "",
  de ? "",
  isGame ? false,
  ...
}:

let
  inherit (pkgs.stdenv) isDarwin;
  inherit (pkgs.stdenv) isLinux;

  isRoot = username == "root";
  homeDirectory =
    if isDarwin then
      "/Users/${username}"
    else if isRoot then
      "/root"
    else
      "/home/${username}";
  userConfigurationPath = "${self}/home/users/${username}";
  userConfigurationPathExist = builtins.pathExists userConfigurationPath;
  userModulesPath = "${self}/home/users/${username}/modules";
  userModulesPathExist = builtins.pathExists userModulesPath;
  sshModulePath = "${homeModules}/ssh";
  sshModuleExistPath = builtins.pathExists sshModulePath;
in
{
  home-manager = {
    # useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit
        inputs
        self
        hostname
        username
        platform
        stateVersion
        isLinux
        commonModules
        homeModules
        overlayModules
        customPkgs
        isWorkstation
        wm
        de
        isGame
        ;
    };

    users.${username} = {
      imports =
        [
          inputs.impermanence.nixosModules.home-manager.impermanence
          inputs.sops-nix.homeManagerModules.sops
          inputs.nur.modules.homeManager.default
          "${commonModules}"
          "${homeModules}"
        ]
        ++ lib.optional sshModuleExistPath sshModulePath
        ++ lib.optional userConfigurationPathExist userConfigurationPath
        ++ lib.optional userModulesPathExist userModulesPath;

      programs.home-manager.enable = true;

      home = {
        inherit username;
        inherit stateVersion;
        inherit homeDirectory;
        # homeDirectory = lib.mkDefault homeDirectory;
      };
    };
  };
}
