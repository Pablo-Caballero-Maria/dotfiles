" Inicia Vim-Plug para la gestión de plugins
call plug#begin('~/.vim/plugged')

" Instala el explorador de archivos NERDTree
Plug 'preservim/nerdtree'

" Instala fzf para el fuzzy finder
Plug 'junegunn/fzf.vim'

" Instala vim-lsp para el soporte de LSP
Plug 'prabirshrestha/vim-lsp'

" Instala asyncomplete y asyncomplete-lsp.vim para el autocompletado
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Instala vim-airline (barra de estado) y sus temas
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Instalar el tema seoul256
Plug 'junegunn/seoul256.vim'

" Instalar vim-devicons
Plug 'ryanoasis/vim-devicons'

" Instalar copilot
Plug 'github/copilot.vim'

call plug#end()

" Configuraciones generales de Vim
autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi LineNr ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi StatusLine ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi VertSplit ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi Pmenu ctermbg=NONE guibg=NONE
autocmd ColorScheme * hi PmenuSel ctermbg=NONE guibg=NONE
colorscheme seoul256
syntax enable
filetype plugin indent on
set relativenumber
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" NERDTree (explorador de archivos)
" Abre NERDTree con Espacio + e
nnoremap <Space>e :NERDTreeToggle<CR>

" Atajo de teclado para buscar palabras con ripgrep
nnoremap <Space>f :Rg<CR>

" Atajos de teclado para cambiar de buffer
nnoremap <C-PageDown> :bnext<CR>
nnoremap <C-PageUp> :bprev<CR>

" Ctrl + click para ir a definición
set mouse=a
nnoremap <C-LeftMouse> :LspDefinition<CR>

" Aceptar sugerencia de autocompletado
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Split horizontal
nnoremap <C-h> :split<CR>

" Split vertical
nnoremap <C-v> :vsplit<CR>

" Atajos para cambiar de split con ctrl más flechas
nnoremap <C-Left> <C-W>h
nnoremap <C-Right> <C-W>l
nnoremap <C-Up> <C-W>k
nnoremap <C-Down> <C-W>j

" LSP: configuración de vim-lsp para Python y TypeScript

" Autocompletado en tiempo real
set completeopt=menuone,noselect,preview
let g:lsp_completion_documentation_enabled = 1

" Autocompletado mientras escribo
set omnifunc=lsp#complete
let g:lsp_auto_enable = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1

" Ctrl + click para ir a definición
nnoremap <C-LeftMouse> :LspDefinition<CR>

" Para Pyright (Python)
autocmd FileType python setlocal omnifunc=lsp#complete
autocmd User lsp_setup call lsp#register_server({'name': 'pyright', 'cmd': ['pyright-langserver', '--stdio'], 'allowlist': ['python']})

" Para tsserver (TypeScript y TSX)
autocmd FileType typescript,typescriptreact setlocal omnifunc=lsp#complete
autocmd User lsp_setup call lsp#register_server({'name': 'tsserver', 'cmd': ['typescript-language-server', '--stdio'], 'allowlist': ['typescript', 'typescriptreact']})

" Configuración general de LSP
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_highlights_enabled = 1
let g:lsp_signs_enabled = 1

" Configuración de indentación
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
