{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.nvim;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };

in
# neovimPkgs = import ./module { inherit pkgs; };
{
  options = {
    module.nvim.enable = mkEnableOption "Enables neovim";
  };

  config = mkIf cfg.enable {
    home.shellAliases.vv = "NVIM_APPNAME=nvim-dh nvim";
    home.shellAliases.fv = "NVIM_APPNAME=nvim-fast nvim";
    home.shellAliases.v = "nvim"; # NVIM_APPNAME=nvim-coder
    home.shellAliases.vw = "NVIM_APPNAME=nvim-writter nvim";

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      # plugins = with pkgs.vimPlugins; [ markdown-preview-nvim ];
      extraPackages = with pkgs; [
        # Auxiliary stuff for currect work
        lua51Packages.lua
        lua51Packages.luarocks
        lua51Packages.jsregexp
        tree-sitter
        fzf

        vimPlugins.rocks-nvim
        vimPlugins.rocks-config-nvim
        vimPlugins.vim-airline

        # Language server protocols, linters, formatters
        # Ansible
        ansible-language-server

        # Bash
        nodePackages.bash-language-server
        shellcheck
        shfmt

        # C

        ccls

        # Docker
        docker-compose-language-service
        dockerfile-language-server-nodejs
        # docker-ls

        # Go
        gopls
        gotools
        gomodifytags
        gotests
        impl
        iferr

        # JSON

        # Lua
        lua-language-server
        selene
        stylua

        # Kubernetes
        helm-ls

        # Nix
        nixd
        nixfmt-rfc-style
        # nil

        # PHP
        intelephense
        phpactor
        php83Packages.php-codesniffer
        php83Packages.php-cs-fixer

        # Python
        ruff
        mypy
        pyright
        basedpyright
        black
        isort

        # Rust
        rust-analyzer
        rustfmt

        # Database
        sqls
        sqlfluff

        # web (JS, TS, HTML, CSS)
        typescript-language-server
        emmet-language-server
        prettierd
        eslint_d
        vscode-langservers-extracted
        tailwindcss-language-server

        # YAML
        yaml-language-server
        yamllint
        yamlfmt

        # Asm
        # Cobol
        # Dart
        # Java
        # Kotlin
        # Objective-c
        # Perl
        # Scala
        # Swift

        # Markdown, Markups langs, TeX
        marksman
        texlab
        ltex-ls
        # neovimPkgs.coderEnv
        # neovimPkgs.fastEnv
        # neovimPkgs.writterEnv
      ];
    };

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    xdg.configFile."nvim-dh" = {
      source = ./DH;
      recursive = true;
    };

    xdg.configFile."nvim" = {
      # -coder
      source = ./NV;
      recursive = true;
    };

    xdg.configFile."nvim-fast" = {
      # -fast neovim
      source = ./FV;
      recursive = true;
    };

    xdg.configFile."nvim-writter" = {
      source = ./VW;
      recursive = true;
    };
  };
}
