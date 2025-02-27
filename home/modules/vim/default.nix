{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.vim;
in
{
  options = {
    module.vim.enable = mkEnableOption "Enables vim";
  };

  config = mkIf cfg.enable {
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        vim-airline
        nerdtree
      ];
      settings = {
        ignorecase = true;
      };
      extraConfig = # vim
        ''
          set number
          set relativenumber
          set mouse=a
          set cursorline
          set noswapfile
          set nobackup
          set nocompatible

          set smarttab
          set autoindent
          set tabstop=2 shiftwidth=2 expandtab
          set scrolloff=8

          set t_Co=256
          syntax on
          set mousehide
          set termencoding=utf-8
          set wrap
          set linebreak

          set encoding=utf-8
          set fileencodings=utf-8,cp1251

          set clipboard=unnamedplus
          set ruler
          set hidden
          nnoremap <S-n> :bnext<CR>
          nnoremap <S-p> :bprevious<CR>
          inoremap jj <Esc>
          nnoremap ; :


          set wildmenu
          " set wildmenu=list:longest
          filetype plugin indent on

          nnoremap <Space>e :NERDTreeToggle<CR>

          let mapleader = " "

          let g:netrw_banner = 0
          let g:netrw_listyle = 3
          let g:netrw_browse_split = 3
        '';
    };
  };
}
