{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.micro;
in
{
  options = {
    module.micro.enable = mkEnableOption "Enables ";
  };

  config = mkIf cfg.enable {
    programs.micro = {
      enable = true;
      settings = {
        autosu = false;
        cursorline = true;
        autosave = 5;
        # colorscheme = "gruvbox";
        fileformat = "unix";
        # lsp = {
        #   # enable = true;
        #   server = "go=gopls,rust=rust-analyzer";
        #   formatOnSave = true;
        #   ignoreMessages = "LS message1 to ignore|LS message 2 to ignore|...";
        #   tabcompletion = true;
        #   ignoreTriggerCharacters = "completion,signature";
        #   autocompleteDetails = false;
        # };
      };
    };
  };
}
