" change mapleader
:let mapleader = ";"

source ~/dotfiles/nvim/Rename.vim



" ##### PLUGINS ####
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')


" Install deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Python autocompletion
Plug 'deoplete-plugins/deoplete-jedi'

"JavaScript autocomplete
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'

" Javascript formatter
Plug 'sbdchd/neoformat'

"React
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" Go to definition
Plug 'davidhalter/jedi-vim'

" python snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Directory NERDTree
Plug 'scrooloose/nerdtree'

" Syntax checking
Plug 'scrooloose/syntastic'

" Sorround writing
Plug 'tpope/vim-surround'

" Comment lines 
Plug 'scrooloose/nerdcommenter'

" search files
Plug 'cloudhead/neovim-fuzzy'

" Themes
Plug 'morhetz/gruvbox'
Plug 'ericbn/vim-solarized'
Plug 'dracula/vim'

" Auto close parenthesis
Plug 'jiangmiao/auto-pairs'

Plug 'vim-python/python-syntax'

" status tabline
Plug 'vim-airline/vim-airline'

" html support
Plug 'mattn/emmet-vim'

" file autoformat
Plug 'ambv/black'

" haskell
Plug 'dag/vim2hs'

" allow seamless navigation between tmux/vim panes
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'

" see file structure
Plug 'majutsushi/tagbar'

Plug 'boeckmann/vim-freepascal'

" Make diff between selected sections
Plug 'AndrewRadev/linediff.vim'


"Vue syntax highlight
Plug 'storyn26383/vim-vue'

" Folding
Plug 'tmhedberg/SimpylFold'


" Initialize plugin system
call plug#end()


syntax enable
set background=dark
colorscheme solarized

"set background=dark
"colorscheme gruvbox
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
let g:palenight_terminal_italics=1

" deoplete opts
" enable by default on startup
let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#ternjs#types = 1

" disable jedi autocomplete, we use deoplete for completion
let g:jedi#completions_enabled = 0


" trigger emmet create tags 
let g:user_emmet_leader_key=','


"let g:jsx_ext_required = 0


" Search for files with crtl + p
nnoremap <C-p> :FuzzyOpen<CR>
nnoremap <C-g> :FuzzyGrep<CR>

" navigate windows
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" navigate tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl: tablast<CR>

" save with crtl s
nnoremap <C-S> :w<CR>


nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s


" add line trailing comma
nnoremap <Leader>, A,<ESC>


nnoremap <Leader>f :NERDTreeFind<CR>

nmap s' ysiw'


" remap ESC to jk 
inoremap jk <ESC>
inoremap <C-j> <C-O>o<up><end>
inoremap <C-k> <C-O>O<down><end>

inoremap <C-e> <C-o>de


inoremap <C-l> <del>

" copy and paste to/from clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>p "+p
nmap <Leader>P "+P
" paste from selection
nmap <Leader>s "*p

" clear search results
nmap <silent> <Leader>/ :nohlsearch<CR>

" show file structure
nmap <F10> :TagbarToggle<CR>
" focus tagbar
nnoremap <F11> :TagbarOpen j<CR>

nmap <F9> :NERDTreeFind<CR>

"dnavigate through buffers
map <Leader>k :bnext<CR>
map <Leader>j :bprev<CR>
map <Leader>q :SyntasticReset<CR>
map <Leader>w :bp<bar>sp<bar>bn<bar>bd<CR>

map <F2> :mksession! ~/vimsesesion.vim <CR>
map <F3> :source ~/vimsesesion.vim <CR>


" insert pdb function
map <Leader>pdb :call Insert_pdb()<CR>

function! Insert_pdb()
  let trace = expand("import ipdb; ipdb.set_trace()")
  execute "normal o".trace
endfunction


map <Leader>djdb :call Insert_django_db()<CR>

function! Insert_django_db()
  let trace = expand("@pytest.mark.django_db")
  execute "normal o".trace
endfunction


map <Leader>te :VimuxPromptCommand<CR>

"Transparent window
"hi Normal guibg=NONE ctermbg=NONE

set splitright
set splitbelow
set cursorline  " mark current cursor line

set tabstop=4	   "Tab width"
set shiftwidth=4   "Tab width"
set softtabstop=4  "Number of columns for tab"
set expandtab	   "Expand tabs to spaces"

set spell
set spelllang=en,es

set number
set relativenumber

set title

set linebreak   "Wrap lines at convenient points, avoid wrapping in the middle of a word"
set scrolloff=5 "number of screen lines to keep above and below the cursor"

set directory=$HOME/.config/nvim/swp//  "save all swp files on single directory"

set smartindent
filetype on
filetype plugin on
filetype indent on

set tw=120
set nowrap
set fo-=t
set colorcolumn=120
highlight ColorColumn ctermbg=233

set history=1000
set undolevels=1000

"allow for regex in search
set magic

set undofile
set undodir=~/nvim/.undodir

" make . work with visually selected lines
vnoremap . :normal.<CR>

" Move (visual)selected text with J and K 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Systastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set showcmd

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args='--ignore=E231,W291,E702,E501,W504,W293,E203'

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_rst_checkers=['sphinx']

"Enable list of buffers on airline
let g:airline#extensions#tabline#enabled = 1 

"Ignore files NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" black max line length for formatting files
let g:black_line_length = 100


" Neoformat use vim's formatprg
let g:neoformat_try_formatprg = 1

" Neoformat -> autoformat javascript on save
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx Neoformat
augroup END


" setup django syntax for html files
au BufNewFile,BufRead *.html set filetype=htmldjango


autocmd BufRead,BufNewFile *.htm,*.html,*.js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.rst setlocal tabstop=3 shiftwidth=3 softtabstop=3

" ### django conf###
" add keybindings to sorround plugin
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
let b:surround_{char2nr("u")} = "{% url \r %}"


" custom autocompletion while wrting django tags
autocmd FileType htmldjango inoremap {%for {% for %}<CR>{% endfor %}<up><left><left><left><Space>
autocmd FileType htmldjango inoremap {%if {% if %}<CR>{% endif %}<up><left><left><left><Space>
autocmd FileType htmldjango inoremap {%b {% block %}<CR>{% endblock %}<up><left><left><left><Space>
autocmd FileType htmldjango inoremap {%u {% url  %}<left><left><left>''<left>
autocmd FileType htmldjango inoremap {# {# #}<left><left><left><Space>
autocmd FileType htmldjango inoremap {% {% %}<left><left><Left>



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
 let g:UltiSnipsExpandTrigger="<tab>"
 "let g:UltiSnipsJumpForwardTrigger="<c-b>"
 let g:UltiSnipsJumpForwardTrigger="<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<C-tab>"
 

let python_highlight_all = 1

let g:python_host_prog = expand('~/nvim/neovim2/bin/python')
let g:python3_host_prog = expand('~/nvim/neovim3/bin/python')


" pascal skeleton
autocmd BufNewFile *.pas call PascalSkeleton()

function! PascalSkeleton()
    call append("0", "PROGRAM " . expand("%:t:r") . ";")    "put filename as program name
    call append("$", "VAR")
    call append("$", "")
    call append("$", "BEGIN")
    call append("$", "")
    call append("$", "END.")
endfunction


" Underline the current line with the given input chars
nnoremap ti :call Underline()<CR>
function! Underline()
    let lineLength = strwidth(getline('.'))
    let underlineChar = input('Underline with: ')
    execute ':normal! o' . repeat(underlineChar, lineLength)
endfunction
