{
  config,
  lib,
  username,
  ...
}:

with lib;

let
  cfg = config.module.git;
in
{
  options = {
    module.git.enable = mkEnableOption "Enables git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "DenHax";
      userEmail = "whatxpw@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.direcrory = "/home/${username}/nix";
      };
    };
  };
}
