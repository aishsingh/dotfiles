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
hi CursorLineNr 		 ctermfg=black ctermbg=grey
hi Comment				 ctermfg=grey
hi Statement			 ctermfg=darkgrey
hi Visual				 ctermbg=darkgrey ctermfg=black
hi SpecialKey			 ctermfg=grey cterm=NONE
hi MatchParen			 ctermbg=darkgreen ctermfg=black cterm=BOLD
hi Pmenu				 ctermbg=black ctermfg=grey 
hi PmenuSel				 ctermbg=darkgreen 
hi NonText				 ctermfg=darkgrey
hi SignColumn			 ctermbg=black
hi Folded				 ctermfg=black ctermbg=darkmagenta cterm=none
hi FoldColumn			 ctermbg=black ctermfg=darkgrey
hi VertSplit 			 ctermfg=black cterm=NONE
hi Constant				 ctermfg=blue
hi Character			 ctermfg=blue
hi Number				 ctermfg=blue
hi Boolean				 ctermfg=blue
hi Float				 ctermfg=blue
hi String				 ctermfg=darkred
hi Directory			 ctermfg=blue
hi SpellBad				 ctermfg=white ctermbg=red
hi SpellCap				 ctermfg=black ctermbg=yellow
hi Search				 ctermfg=black ctermbg=yellow cterm=none

set number
set nocompatible
set laststatus=2
set noshowmode
set nobackup

let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 25
let NERDTreeShowBookmarks = 1
"NERDTree for exploring project files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
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
"set list lcs=tab:\|\ 

" Note, perl automatically sets foldmethod in the syntax file
"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

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

set clipboard=unnamed

nmap <Leader>\ :TagbarToggle<CR>

let g:notes_directories = ['~/.vim/notes']
"let g:syntastic_cpp_compiler = '-std=c++11' 

" solid underscore
let &t_SI .= "\<Esc>[3 q"
" solid block
let &t_EI .= "\<Esc>[1 q"
" 1 or 0 -> blinking block
" 3 -> blinking underscore
" Recent versions of xterm (282 or above) also support
" 5 -> blinking vertical bar
" 6 -> solid vertical bar

" Code folding
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif
set foldmethod=marker
set foldtext=MyFoldText()
function! MyFoldText()
	let lines = 1 + v:foldend - v:foldstart
	let spaces = repeat(' ', indent(v:foldstart) -1)

	let linestxt = 'lines'
	if lines == 1
		linestxt = 'line'
	endif

	let firstline = getline(v:foldstart)
	let line = firstline

	"return spaces . '+' . v:folddashes . ' ' . lines . ' ' . linestxt . ': ' . line . ' '
	return spaces . line . ' +' . v:folddashes . ' ' . lines . ' ' . linestxt . ' '
endfunction
																																		
" TagBar
hi TagbarHighlight ctermfg=magenta ctermbg=black cterm=none
hi TagbarKind	   ctermfg=blue
hi TagbarHelp 	   ctermfg=darkgrey
hi TagbarScope 	   ctermfg=grey
autocmd FileType c,cpp nested :TagbarOpen
let g:tagbar_width = 25
let g:tagbar_autoshowtag = 1
let g:tagbar_compact = 1
" less delay
set updatetime=100

" easymotion
map , <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
hi EasyMotionTarget ctermbg=none ctermfg=blue
hi EasyMotionShade  ctermbg=none ctermfg=darkgrey
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred
