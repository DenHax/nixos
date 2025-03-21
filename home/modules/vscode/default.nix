{
  self,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.vscode;
in
{
  imports = [
    "${self}/home/modules/vscode/keybindings"
    "${self}/home/modules/vscode/extentions"
    "${self}/home/modules/vscode/settings"
  ];

  options = {
    module.vscode.enable = mkEnableOption "Enables vscode";
  };

  config = mkIf cfg.enable {
    stylix.targets.vscode.enable = false;
    programs.vscode = {
      enable = true;
      enableUpdateCheck = false;
    };
  };
}
