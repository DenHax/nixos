{ self, ... }:

{
  devenv = {
    description = "Flake devenv template";
    path = "${self}/template/devenv";
  };

  devshell = {
    description = "Flake devshell template";
    path = "${self}/template/devshell";
  };

  module = {
    description = "NixOS module template";
    path = "${self}/template/module";
  };

  overlay = {
    description = "NixOS overlay template";
    path = "${self}/template/overlay";
  };
}
