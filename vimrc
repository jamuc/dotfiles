"Map the keys fd to the escape key in insert mode
inoremap fd <esc>

"Activate smart indent and set tab to 2 spaces.
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2

"set hybrid line numbers
set number relativenumber

"Activate syntax highlighting
syntax on

"Set the leader key
let mapleader = ","

"Shortcut to search for files
nnoremap <Leader>f :Files<CR>
"Shortcut to search in files
nnoremap <Leader>r :Rg<CR>
"Shortcut edit vimrc
nnoremap <Leader>ev :split<CR>:e ~/.vimrc<CR>
"Shortcut create file in current directory
nnoremap <Leader>ed :e %:p:h/

"Load all the plugins
call plug#begin()
"Install junegunn fzf plugins
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Install rust
Plug 'rust-lang/rust.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()

"Rg should only search in files and not file names
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
