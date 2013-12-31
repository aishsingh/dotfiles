execute pathogen#infect()
syntax on
filetype plugin indent on
set t_Co=256

let g:solarized_termcolors=256
"set background=dark
"colorscheme molokai 
let g:molokai_original = 1
let g:rehash256 = 1

 
set cursorline
hi CursorLine cterm=NONE ctermbg=black

set number
set nocompatible
set laststatus=2
set noshowmode
highlight VertSplit cterm=none gui=none

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif

if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
	augroup END
endif

set mouse+=a
if &term =~ '^screen'
	"tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

let g:airline#extensions#tabline#enabled = 0

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1    " Put errors on left side
let g:syntastic_quiet_warnings = 1  " Only errors, not warnings please
let g:syntastic_auto_loc_list = 2   " Only show errors when I ask
"let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'gcc'
if has('unix')
	let g:syntastic_error_symbol = '★'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '⚠'
	let g:syntastic_style_warning_symbol = '>'
else
	let g:syntastic_error_symbol = '!'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '.'
	let g:syntastic_style_warning_symbol = '>'
endif

"let g:airline_theme = 'airlineish'

command W w "Fixing accidental Shift key
command Wq w
command WQ wq
command Q q

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

command C let @/=""
