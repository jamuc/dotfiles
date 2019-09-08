" VIM Addon Manager
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
    \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

set nocompatible              " be iMproved, required
filetype off                  " required

" Add snipmate snippet engine
ActivateAddons vim-snippets snipmate
" Add tmux navigator
ActivateAddons github:christoomey/vim-tmux-navigator
"Add fzf
ActivateAddons github:junegunn/fzf
"Add syntastic
ActivateAddons github:vim-syntastic/syntastic
"Add rust support
ActivateAddons github:rust-lang/rust.vim


"set syntax highlighting
:syntax on

"set numbers
set number
"set mapleader to coma
let mapleader=","

"map ESC to fd
inoremap fd  <esc>

"map leader b
:nnoremap <leader>a :b#<cr>
"map leader for file creation
:nnoremap <leader>c :e %:p:h/

"set up tabbing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Set indentation depending on the file type
filetype plugin indent on
"show command in bottom bar
set showcmd
"visual autocomplete for command menu
set wildmenu

"Quick use of the find option
nnoremap <leader>f :find 
"Set the search path to the current directory
set path=$PWD/**
"Quick edit the current directory
nnoremap <leader>ed :e %:p:h<cr>
"quickly go to the definition of the tag

set rtp+=/Users/jason.franklin/Repos/events

"fzf
:nnoremap <leader>f :FZF<cr>
"vsplit
:nnoremap <leader>v :vsplit<cr>

"ctags
:nnoremap <leader>t :tag 
set tags=.git/tags

"run syntastic rubocop
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
