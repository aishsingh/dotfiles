execute pathogen#infect()
syntax on

set expandtab
set relativenumber
set nocompatible

"tell vim we are in a 256 colour terminal to fix vim-css-color not working
set t_Co=256

filetype plugin indent on

colorscheme deep

"change bg colour of current line
set cursorline
set cursorcolumn
set number
set nocompatible
set laststatus=2
set noshowmode
set nobackup
set modeline
set autochdir

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
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"syntastic for syntax checking
" let g:syntastic_enable_c_checker = 1
" let g:syntastic_enable_cpp_checker = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1    " Put errors on left side
"let g:syntastic_quiet_warnings = 1  " Only errors, not warnings please
"let g:syntastic_auto_loc_list = 2   " Only show errors when I ask
let g:syntastic_disabled_filetypes = ['html', 'js']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_c_check_header = 0
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_compiler = 'gcc'
" let g:syntastic_c_compiler = 'gcc -std=c99 -lSDL2 -lSDL2_gfx -lSDL2_ttf'
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
" cmap W w
" cmap Q q

"clear searchs by typing :C
command C let @/=""
cmap w!! w !sudo tee > /dev/null %

"set tab length
set tabstop=4 
set shiftwidth=4

"Tab indentation symbols
"set list
"set list lcs=tab:\¦\ 

" Note, perl automatically sets foldmethod in the syntax file
"autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
"autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

let g:CommandTMaxHeight = 25

"MRU view recent files
nmap <leader>mru :MRU<CR>

"change fold column size (leader = '\')
nmap <leader>] :set foldcolumn+=1<CR>
nmap <leader>[ :set foldcolumn-=1<CR>

"Startify splash screen
let g:startify_custom_header = [
\ '  __     ___             _____ _   _ ',
\ '  \ \   / (_)_ __ ___   |___  | | | |   '  ,
\ '   \ \ / /| | ''_ ` _ \     / /| |_| |',
\ '    \ V / | | | | | | |   / / |___  |',
\ '     \_/  |_|_| |_| |_|  /_/(_)   |_|',
\ '',
\ '',
\ ]
      " \ map(split(system('fortune'), '\n'), '"   ". v:val') + ['','']
      " \ map(split(system('fortune | cowsay -f stegosaurus'), '\n'), '"   ". v:val') + ['','']
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

hi StartifyHeader		guifg=darkgreen ctermfg=magenta
hi StartifyBracket		guifg=darkgrey ctermfg=darkgrey
hi StartifyNumber		guifg=magenta ctermfg=magenta
hi StartifySection		guifg=darkgreen ctermfg=darkgreen
hi StartifyPath			guifg=darkgrey ctermfg=darkgrey
hi StartifyFile			guifg=darkgrey ctermfg=grey
hi StartifySlash		ctermfg=darkgrey
hi StartifySpecial		ctermfg=darkgrey

"Unbind the cursor keys in insert, normal and visual modes.
"for prefix in ['i', 'n', 'v']
	"for key in ['<Up>', '<Down>', '<Left>', '<Right>']
		"exe prefix . "noremap " . key . " <Nop>"
	"endfor
"endfor

"When feeling hardcore
"noremap h <NOP>
"noremap j <NOP>
"noremap k <NOP>
"noremap l <NOP>

set clipboard=unnamed

nmap <Leader>\ :TagbarToggle<CR>

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
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldmethod=syntax
set foldtext=NeatFoldText()

set foldlevel=0
set foldnestmax=1 "only fold top level

let c_no_comment_fold = 1

" Unfold all automatically on c headers
autocmd BufWinEnter *.h set foldlevel=10

" save/load view automatically
" autocmd BufWinLeave *.* mkview!
" autocmd BufWinEnter *.* silent loadview



																																		
" TagBar
autocmd FileType c,cpp,pascal nested :TagbarOpen
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

nmap ; :
" Func as insert mode in normal mode
"nmap <CR> i<CR><Esc>
"nmap <BS> <BS>x

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<Cr>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<Cr>'

"nmap <F11> :SCCompile<cr> 
"nmap <F12> :SCCompileRun<cr> 

nmap <F11> :!sudo /data/Swinburne/COS10009/SwinGame/run.sh<cr> 
nmap <F12> :!sudo /data/Swinburne/COS10009/SwinGame/build.sh && /data/Swinburne/COS10009/SwinGame/run.sh<cr> 

function! Ranger()
    " Get a temp file name without creating it
    let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
    " Launch ranger, passing it the temp file name
    silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
    " If the temp file has been written by ranger
    if filereadable(tmpfile)
        " Get the selected file name from the temp file
        let filetoedit = system('cat '.tmpfile)
        exec 'edit '.filetoedit
        call delete(tmpfile)
    endif
    redraw!
endfunction

nmap <leader>R :call Ranger()<cr>

" View currnet highlighting type and name
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

let g:ctrlp_extensions = ['funky']

nnoremap <c-o> :CtrlPFunky<Cr>

noremap <leader><Cr> :!clear && make debug<cr>

" T-Comment
map <leader>cc <c-_><c-_>
map <leader>ca <c-_>a /* */<CR>
call tcomment#DefineType('c', '// %s')
call tcomment#DefineType('cpp', '// %s')

" Switch between buffers without saving
set hidden

" Abreviations
iab teh the
iab Teh The

" vim : menu
set wildmenu

" Bubble single lines
nmap <PageUp> [e
nmap <PageDown> ]e
" Bubble multiple lines
vmap <PageUp> [e
vmap <PageDown> ]e

" Select all in indent level
function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfun
nmap <Space> :call SelectIndent()<CR>

" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("ls | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction

" map <c-t> :call DmenuOpen("tabe")<cr>
" map <c-f> :call DmenuOpen("e")<cr>

" jkl; movement
" noremap ; l
" noremap j h
" noremap k j
" noremap l k

" Markdown is recognised when *.md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Preview markdown with the help of `instant_markdown` plugin using dwb
let g:instant_markdown_autostart = 1
command MDPreview execute "!dwb 'localhost:8090' >& /dev/null &"

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '/home/aish/dotfiles/vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"
