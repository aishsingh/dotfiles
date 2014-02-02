execute pathogen#infect()
syntax on

"tell vim we are in a 256 colour terminal to fix vim-css-color not working
set t_Co=256

filetype plugin indent on

"change bg colour of current line
set cursorline
hi CursorLine cterm=NONE ctermbg=black ctermfg=NONE

"main vim colour
hi LineNr				 ctermfg=darkgrey
hi CursorLineNr 		 ctermfg=grey
hi Comment				 ctermfg=grey
hi Statement			 ctermfg=darkgrey
hi Visual				 ctermbg=darkgreen
hi Visual				 ctermfg=black
hi SpecialKey			 ctermfg=black cterm=NONE
hi MatchParen			 ctermbg=darkgreen ctermfg=black cterm=BOLD
hi Pmenu				 ctermbg=black ctermfg=grey 
hi PmenuSel				 ctermbg=darkgreen 
hi NonText				 ctermfg=darkgrey
hi SignColumn			 ctermbg=black
hi Folded				 ctermbg=black
hi FoldColumn			 ctermbg=black ctermfg=darkgrey
hi VertSplit 			 ctermfg=black cterm=NONE

set number
set nocompatible
set laststatus=2
set noshowmode

"NERDTree for exploring project files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | CommandT | endif 
"open NERDTree automatically when a file is not specified

if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
	autocmd!
	au InsertEnter * set timeoutlen=0
	au InsertLeave * set timeoutlen=1000
	augroup END
endif

"resize vim windows with mouse correctly inside tmux
set mouse+=a
if &term =~ '^screen'
	"tmux knows the extended mouse mode
	set ttymouse=xterm2
endif

"airline theme
"let g:airline_theme = 'airlineish'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"syntastic for syntax checking
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1    " Put errors on left side
"let g:syntastic_quiet_warnings = 1  " Only errors, not warnings please
"let g:syntastic_auto_loc_list = 2   " Only show errors when I ask
"let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'gcc'
if has('unix')
	let g:syntastic_error_symbol = '✕'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '⚠'
	let g:syntastic_style_warning_symbol = '>'
else

	let g:syntastic_error_symbol = '!'
	let g:syntastic_style_error_symbol = '>'
	let g:syntastic_warning_symbol = '.'
	let g:syntastic_style_warning_symbol = '>'
endif

"fix for accidental Shift key
cmap W w
cmap Q q

"clear searchs by typing :C
command C let @/=""
cmap w!! w !sudo tee > /dev/null %

"set tab length
set tabstop=4
set shiftwidth=4

"Tab indentation symbols
"set list
"set listchars=tab:\│\ 

" Note, perl automatically sets foldmethod in the syntax file
autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

let g:CommandTMaxHeight = 25

"MRU view recent files
nmap <CR> :MRU<CR>

"change fold column size (leader = '\')
nmap <leader>] :set foldcolumn+=1<CR>
nmap <leader>[ :set foldcolumn-=1<CR>

"Startify splash screen
let g:startify_custom_header =
      \ map(split(system('fortune | cowsay -f stegosaurus'), '\n'), '"   ". v:val') + ['','']
let g:startify_bookmarks = [ '~/.vimrc', 
							\'~/.Xresources', 
							\'~/.config/bspwm/bspwmrc', 
							\'~/.config/sxhkd/sxhkdrc', 
							\'~/.xinitrc' ]
let g:startify_list_order =  [['   Recently modified'],
            				\ 'files',
            			    \ ['   Recently modified in current directory'],
            				\ 'dir',
            			    \ ['   Sessions:'],
            				\ 'sessions',
            			    \ ['   Bookmarks:'],
            				\ 'bookmarks' ]

hi StartifyHeader		ctermfg=darkgreen
hi StartifyBracket		ctermfg=darkgrey
hi StartifyNumber		ctermfg=darkred
hi StartifySection		ctermfg=darkgreen
hi StartifyPath			ctermfg=darkgrey
hi StartifyFile			ctermfg=grey
hi StartifySlash		ctermfg=darkgrey
hi StartifySpecial		ctermfg=darkgrey

"Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
	for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		exe prefix . "noremap " . key . " <Nop>"
	endfor
endfor

"When feeling hardcore
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>
