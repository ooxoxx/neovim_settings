call plug#begin()
Plug 'mileszs/ack.vim' "search in file content using ack
Plug 'dense-analysis/ale' "linter engine
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim' "theme
Plug 'kien/ctrlp.vim' "fuzzy file finder
Plug 'mattn/vim-gist' "upload to gist.github
Plug 'preservim/nerdtree' "directory explorer
Plug 'soft-aesthetic/soft-era-vim' "theme
Plug 'ervandew/supertab' "completion advice using <tab>
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hzchirs/vim-material' "theme
Plug 'prettier/vim-prettier' "auto wrap
Plug 'tpope/vim-sensible' "enhanced default settings
Plug 'tpope/vim-sleuth' "handle indent acording to old files
Plug 'tpope/vim-surround' "handle surroudings, super useful
Plug 'mattn/webapi-vim' "unknown utility
call plug#end()

" Indent using spaces instead of tabs
set expandtab

" The number of spaces to use for each indent
set shiftwidth=2

" Number of spaces to use for a <Tab> during editing operations
set softtabstop=2"

" so I can go up an down wrapped lines
map j gj
map k gk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
:set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't wrap lines
:set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle commenting of lines with command + /
nmap <D-/> :Commentary<CR>
vmap <D-/> :Commentary<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp use .gitignore
" https://github.com/kien/ctrlp.vim/issues/174
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use babylon parser with prettier
let g:prettier#config#parser="babylon"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run prettier asynchronously before saving
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use JSON in .babelrc files
autocmd BufRead,BufNewFile .babelrc setfiletype json

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow JSX in .js files
let g:jsx_ext_required=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore node_modules with command-t
let g:CommandTWildIgnore=&wildignore . ",*/node_modules"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search matches
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings for moving lines and preserving indentation
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle file drawer in/out
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

" Treat mdx as md
autocmd BufNewFile,BufRead *.mdx set syntax=markdown

" clear search with shift+enter
nnoremap <S-CR> :noh<CR>

" Prettier
nnoremap = :Prettier<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
:autocmd UIEnter * set guifont=Source\ Code\ Pro:h14

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide pointless junk at the bottom, doesn't work in .vimrc for some reason?
:autocmd UIEnter * set laststatus=0
:autocmd UIEnter * set noshowmode "don't show --INSERT--
:autocmd UIEnter * set noruler "don't show line numbers/column/% junk

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep the error column always visible (jumpy when linter runs on input)
:autocmd UIEnter * set signcolumn=yes

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map Shift + F to Ack.vim
nmap <S-F> :Ack<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Random color schemes!
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction
:autocmd UIEnter * command NewColor call RandomColorScheme()

function RandomBase16()
  let mycolors = split(globpath(&rtp,"**/colors/base16*dark*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

:autocmd UIEnter * command C call RandomBase16()

" Start new windows with a random color scheme
:autocmd UIEnter * call RandomBase16()
:set termguicolors
:colorscheme base16-materia

nnoremap ,, :C<CR>:colorscheme<CR>
