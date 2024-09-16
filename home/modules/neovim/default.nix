{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.nvim;
in
{
  options = {
    module.nvim.enable = mkEnableOption "Enables neovim";
  };

  config = mkIf cfg.enable {
    home.shellAliases.vv = "NVIM_APPNAME=nvim-dh nvim";
    home.shellAliases.vc = "NVIM_APPNAME=nvim-coder nvim";
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
        # luajitPackages.luarocks

        # Language server protocols, linters, formatters

        # YAML
        yaml-language-server
        yamllint
        yamlfmt

        # Docker & Kubernetes
        docker-ls

        # Go
        gopls
        gotools
        gomodifytags
        gotests
        impl
        iferr

        # Nix
        nil
        nixfmt-rfc-style

        # web (JS, TS, HTML, CSS)
        typescript-language-server
        emmet-language-server
        prettierd
        eslint_d
        vscode-langservers-extracted
        tailwindcss-language-server

        # Rust
        rust-analyzer
        rustfmt

        # Bash
        nodePackages.bash-language-server
        shellcheck
        shfmt

        # Lua
        lua-language-server
        selene
        stylua

        # Database
        sqls
        sqlfluff

        # Python
        ruff
        mypy
        pyright
        basedpyright
        black
        isort

        # Markdown, Markups langs, TeX
        marksman
        texlab
        ltex-ls

        # Java

        # Kotlin

        # Scala

        # Dart

        # Asm

        # Cobol

        # Dart

        # Objective-c

        # Perl

        # Swift
      ];
    };
    xdg.configFile."nvim-dh" = {
      source = ./DH;
      recursive = true;
    };

    xdg.configFile."nvim-coder" = {
      source = ./NV;
      recursive = true;
    };

    xdg.configFile."nvim-writter" = {
      source = ./VW;
      recursive = true;
    };
  };
}
