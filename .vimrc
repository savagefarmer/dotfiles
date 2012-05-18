" Make vim more useful
set nocompatible

" Set syntax highlighting options.
set t_Co=256                " Enable 256 colors. Powerline plugin and 'desert256' theme need this. Requires $TERM is xterm-256color.
                            " Put this in your ~/.bashrc:
                            " if [ -e /usr/share/terminfo/x/xterm-256color ]; then
                            "         export TERM='xterm-256color'
                            " else
                            "         export TERM='xterm-color'
                            " fi

syntax on                   " Enable syntax highlighting.
colorscheme desert256       " Use a nice theme.


" Enabled later, after Pathogen
filetype off


" Essential keyboard shorcuts
" (don't put comments on the same line as the remap command, this may cause problems)

" Remap escape sequence to pressing semicolon twice
imap ;; <Esc>l

" In normal mode, convert semicolon to colon, for easy command entering.
nnoremap ; :

" The mapleader is important, it is used for easy shortcuts.
let mapleader=","



" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo


" The most basic settings
set encoding=utf-8 nobomb       " BOM often causes trouble
set hidden                      " When a buffer is brought to foreground, remember undo history and marks.
set magic                       " Enable extended regexes.
set mouse=a                     " Enable mouse in all in all modes.
set backspace=indent,eol,start  " Make backspace act like in all normal editors.
set history=1000                " Increase history from 20 default to 1000
set undofile                    " Persistent undo (saved in ~/.vim/undo)
set ttyfast                     " Send more characters at a given time.
set ttymouse=xterm              " Set mouse type to xterm.

" Basic visual settings
set nu                          " Enable line numbers.
set title                       " Show the filename in the window titlebar.
set visualbell                  " Use visual bell instead of audible bell
set cursorline                  " Highlight current line
set laststatus=2                " Always show status line
set report=0                    " Show all changes.
set wildmenu                    " Hitting TAB in command mode will show possible completions above command line.
set splitright                  " Open new windows on the right.

" Tab/line/indent settings
set autoindent                  " Copy indent from last line when starting new line.
set nowrap                      " Do not wrap lines.
set expandtab                   " Expand entered tabs to spaces
set shiftwidth=4                " The # of spaces for indenting. (Indent operations are << and >>)
set softtabstop=4               " Tab key results in 4 spaces.
set smarttab                    " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
vnoremap < <gv                  " Don't stop visual mode after indenting
vnoremap > >gv                  " 

" Cursor behaviour and scrolling
set ruler                       " Show the cursor position
set scrolloff=3                 " Start scrolling three lines before horizontal border of window.
set sidescrolloff=3             " Start scrolling three columns before vertical border of window.
set nostartofline               " Don't reset cursor to start of line when moving around.
nnoremap <C-e> 3<C-e>           " Speed up viewport scrolling (down)
nnoremap <C-y> 3<C-y>           " Speed up viewport scrolling (up)

" Formatting options
set formatoptions=
set formatoptions+=c            " Format comments
set formatoptions+=r            " Continue comments by default
set formatoptions+=o            " Make comment when using o or O from comment line
set formatoptions+=q            " Format comments with gq
set formatoptions+=n            " Recognize numbered lists
set formatoptions+=2            " Use indent from 2nd line of a paragraph
set formatoptions+=l            " Don't break lines that are already long
set formatoptions+=1            " Break before 1-letter words

" Search options
set gdefault                    " By default add g flag to search/replace. Add g to toggle.
set hlsearch                    " Highlight searches
set ignorecase                  " Ignore case of searches.
set incsearch                   " Highlight dynamically as pattern is typed.
set wrapscan                    " Searches wrap around end of file

" Code folding
set foldenable                  " Enable folding
set foldcolumn=4                " Column to show folds
set foldlevel=2                 " 
set foldmethod=syntax           " Markers are used to specify folds.
set foldminlines=0              " Allow folding single lines
set foldnestmax=3               " Set max fold nesting level


" KEYBOARD SHORTCUTS

" Enter newlines from normal mode by pressing Enter
map <S-Enter> O<Esc>
map <CR> o<Esc>

" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
" Use (Ctrl-w, s) and (Ctrl-w, v) for horizontal and vertical splitting.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Buffer switching with Alt-j and Alt-k.
map l :bnext<CR>               
map h :bprev<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Only weaklings use the arrow keys! :)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Clear search highlights with ,/
nmap <silent> <Leader>/ :nohlsearch<CR>

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Remap :W to :w
command W w

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓
imap aa λ

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Toggle taglist
nnoremap <silent> <F3> :TlistToggle<CR>
" Toggle paste mode
nnoremap <F5> :set invpaste<CR>:set paste?<CR>
" Toggle highlight
nnoremap <F6> :set invhls<CR>:set hls?<CR>
" Toggle numbers/foldcolumn for easier c/p
nnoremap <F8> :if &nu == 1<CR>let &nu=0<CR>set nonu<CR>set foldcolumn=0<CR>else<CR>let &nu=1<CR>set nu<CR>set foldcolumn=1<CR>endif<CR> :set nu?<CR>
" Fold to 1 level and back
nnoremap <F9> :if &foldlevel==1 && exists("foldlevel")<CR>let &foldlevel=foldlevel<CR>else<CR>let foldlevel=&foldlevel<CR>let &foldlevel=1<CR>endif<CR> :set foldlevel?<CR>
" Fold less or more
nnoremap <F10> zm:set foldlevel?<CR>
nnoremap <F11> zr:set foldlevel?<CR>

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ exe "normal! g`\"" |
  \ endif






" PLUGINS

" Emulate bundles, allow plugins to live independantly. Easier to manage.
" Use :call pathogen#helptags() to generate help documentation after installing new plugins.
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Surround: https://github.com/tpope/vim-surround
" cs"'     replaces "a" with 'a'
" ds'      removes a pair of '

" Powerline: https://github.com/Lokaltog/vim-powerline
let g:Powerline_symbols = 'fancy'                           " Enable a nice statusbar (requires terminal to use custom font)

" Nerdtree: https://github.com/scrooloose/nerdtree
set autochdir
let NERDTreeChDirMode=2
nmap <silent> <special> <F2> :NERDTree .<CR>        " New nerdtree with F2
autocmd VimEnter * if argc() == 0 | NERDTree | endif        " Open nerdtree automatically if we run vim without arguments.

" Snipmate: https://github.com/msanders/snipmate.vim

" MinibufExpl: https://github.com/fholgado/minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0                        " Always show tabs
hi link MBEVisibleActive SpecialKey                         " Make the current active buffer bright green if its unchanged.
hi link MBEChanged Title                                    " Give changed (inactive) buffer a red font.

" Taglist: http://www.vim.org/scripts/script.php?script_id=273
" Requires Ctags:
"    sudo apt-get install exuberant-ctags 
let Tlist_Use_Right_Window = 1                              " Open taglist on right side of the screen.

" Command-T Plugin: http://git.wincent.com/command-t.git/blob/HEAD:/doc/command-t.txt
" To install, first get files:
"   git clone git://git.wincent.com/command-t.git ~/.vim/bundle/command-t
"   sudo apt-get install ruby ruby-bundler rubygems rake
" Build C extension:
"   cd ~/.vim/ruby/command-t
"   ruby extconf.rb
"   make
" Install it
"   cd ~/.vim/bundle/command-t
"   bundle install
"   rake make
" Then use <Leader>t to open it.

" Yankring: http://www.vim.org/scripts/script.php?script_id=1234
nnoremap <silent> <F4> :YRShow<CR> 


