" Plugins installed using the Plug
" Run this if it is not installed
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Wrap your plugins between the call plug#begin() and call plug#end()
call plug#begin()
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" BEGIN coc configuration
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

set updatetime=300

" Displays documentation for the word under the cursor in the same way
nnoremap <silent> K :call CocAction('doHover')<CR>

" Uncomment next line if you want to open definition in a new tab
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
" Uncomment next line to open definition in the same tab, kinda weird, I
" prefer to use the one from above
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

" END coc configuration

nmap <leader>n :NERDTreeToggle<CR>

set number
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Themes and stuff
syntax on
set t_Co=256
set cursorline
set background=light
colorscheme Papercolor 

" FZF add folders that you don't want them from being displayed as results
nmap <C-P> :FZF<CR>
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name .next \) -prune -o -print'

