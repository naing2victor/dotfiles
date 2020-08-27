execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
filetype indent on

" enable syntax highlighting
syntax enable

" use spaces instead of tabs
set expandtab smarttab

" 1 tab == 2 spaces
set tabstop=2 softtabstop=2 shiftwidth=2

" exclude version control directories
set wildignore+=*/.git/*

" auto indentation
set smartindent autoindent

" increment case ignore search
set smartcase ignorecase incsearch

" sound off
set noerrorbells

" no backup/swap files
set noswapfile nobackup

" recursive path
set path=.,**

" split option
set splitbelow splitright

" theme option
set termguicolors background=dark cursorline
colorscheme default

" :W sudo saves the file
" (works in vim but not in neovim)
" (useful for handling the permission-denied error)
command G :execute ':silent w !sudo tee % > /dev/null' | :edit!

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Strip all trailing whitespace
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Highlight all trailing whitespace
nnoremap <F8> :let _s=@/<Bar>:%s/;\s\+$/;/e<Bar>:let @/=_s<Bar><CR>
" assign mapleader
let mapleader = ' '

" split navigation with Ctrl + hjkl
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
tnoremap <C-h> <c-\><c-n><c-w>h
tnoremap <C-j> <c-\><c-n><c-w>j
tnoremap <C-k> <c-\><c-n><c-w>k
tnoremap <C-l> <c-\><c-n><c-w>l
inoremap <C-h> <Esc><c-w>h
inoremap <C-j> <Esc><c-w>j
inoremap <C-k> <Esc><c-w>k
inoremap <C-l> <Esc><c-w>l
vnoremap <C-h> <Esc><c-w>h
vnoremap <C-j> <Esc><c-w>j
vnoremap <C-k> <Esc><c-w>k
vnoremap <C-l> <Esc><c-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" airline plugin
let g:airline_theme = 'dracula'

" gruvbox plugin
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" gruvbox mapping
nnoremap <silent> thl :call gruvbox#hls_toggle()<CR>

" ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_open_new_files = 'v'
let g:ctrlp_open_multiple_files = 'v'

" ctrlp mapping
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

" NERDTree mapping
map <C-n> :NERDTreeToggle<CR>

" open terminal inside vim
map <Leader>tt :vnew term://bash<CR>

" Neovim :Terminal
tmap <Esc> <C-\><C-n>
tmap <C-w> <Esc><C-w>

" tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
      call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
