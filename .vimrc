set number
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
imap <Nul> <C-Space>
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set termguicolors
set autoindent
set smartindent
set cindent
syntax on
set backspace=indent,eol,start
set hlsearch
set incsearch
set wildmenu
set t_Co=256
set clipboard+=unnamed
set shiftwidth=4
set tabstop=4
let g:airline_theme = 'sakura'
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:lsp_diagnostics_echo_cursor = 1
let mapleader = "\<Space>"
set termguicolors
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nmap <C-k> :LspHover<CR>
nnoremap <expr><c-f> lsp#scroll(+4)
nnoremap <expr><c-d> lsp#scroll(-4)
nmap <C-l> :LspDefinition<CR>
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'franbach/miramare'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'sainnhe/everforest'
Plugin 'ryanoasis/vim-devicons'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'is-hoku/sakura'
Plugin 'mattn/vim-goimports'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'sebdah/vim-delve'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'stephpy/vim-php-cs-fixer'

call vundle#end()
colorscheme sakura

if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

" junegunn/fzf junegunn/fzf.vim
if executable('rg')
	command! -bang -nargs=* Rg
		\ call fzf#vim#grep(
		\   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
		\   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

" vim-scripts/dbext.vim
if filereadable(expand('~/.dbext_profile'))
	source ~/.dbext_profile
endif
let g:dbext_default_history_file = '~/.dbext_history'

command! Jqf %!jq '.'

" dhruvasagar/vim-table-mode
let g:table_mode_corner='|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" prettier/vim-prettier
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 1

" hhatto/autopep8
"let g:autopep8_on_save = 1
autocmd BufWritePost *.py :silent! %!autopep8 -
" nvie/vim-flake8
autocmd BufWritePost *.py call flake8#Flake8()

"stephpy/vim-php-cs-fixer
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
