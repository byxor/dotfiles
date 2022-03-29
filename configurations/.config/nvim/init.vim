" plugins
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'alec-gibson/nvim-tetris'
Plug 'johngrib/vim-game-snake'
Plug 'seandewar/nvimesweeper'
call plug#end()

" helper functions
function Handle24BitColor()
    "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
    "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
    "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
    if (empty($TMUX))
      if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      endif
      "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
      "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
      " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
      if (has("termguicolors"))
        set termguicolors
      endif
    endif
endfunction


" reload/edit vimrc
:command Reload :source ~/.config/nvim/init.vim
:command EditVimrc :e ~/.config/nvim/init.vim

" tabs and spaces
set tabstop=4 shiftwidth=4 expandtab

" line numbers
set number
set relativenumber

" mouse support
set mouse=a

" color scheme
call Handle24BitColor()
syntax on
colorscheme onedark

" buffers
map ]q :cnext<CR>
map [q :cprevious<CR>
map ]b :bnext<CR>
map [b :bprevious<CR>
map ]t :tabnext<CR>
map [t :tabprevious<CR>
map ,q :bdelete<CR>

" path
set path+=**
set wildignore+=*/node_modules/*,*/target/*

" file browser tweaks
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3
filetype plugin on " not sure what this does tbh

" tab completion for files"
set wildmenu

" ctag support
command MakeTags !ctags -R .

" fugitive git shortcuts
nnoremap ,gg :Gvdiffsplit!<CR>
nnoremap ,gu :diffupdate<CR>
nnoremap ,gh :diffget //2<CR>:diffupdate<CR>
nnoremap ,gj ]c 
nnoremap ,gk [c 
nnoremap ,gl :diffget //3<CR>:diffupdate<CR>

" intellij-like shortcuts for Ag/Rg and FZF"
nnoremap ,F :Rg<CR>
nnoremap ,f :Files<CR>
nnoremap ,b :Buffers<CR>
let g:fzf_preview_window = ['down:70%', 'ctrl-/']

" fix annoying 'No save since last change' (or whatever) message
set hidden

" coffee script stuff, not sure what this does
syntax enable
filetype plugin indent on
