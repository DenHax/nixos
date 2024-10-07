{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.tmux;
in
{
  options = {
    module.tmux.enable = mkEnableOption "Enables tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      # prefix = "C-a";
      keyMode = "vi";
      clock24 = true;
      extraConfig = # bash
        ''
          bind s choose-tree -sZ -O name

          unbind %
          bind - split-window -h

          unbind '"'
          bind - split-window -v
        '';
      terminal = "screen-256color";
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        power-theme
        sessionist
        {
          plugin = resurrect;
          extraConfig = # bash
            ''
              set -g @resurrect-capture-contents 'on'
            '';
        }
        {
          plugin = continuum;
          extraConfig = # bash
            ''
              set -g @continuum-restore 'on'
            '';
        }
      ];
    };
  };
}
