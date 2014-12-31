filetype plugin indent on

syntax on


" ---set *--- {
set fileencodings=utf8,sjis
set fileformats=unix,dos,mac

set nocompatible

set ignorecase
set smartcase
" highlighting searched words
set hlsearch
" incremental search on
set incsearch

" show bracket match
set showmatch
set matchtime=2

set autoindent
set wrap

set scrolloff=20

set backspace=indent,eol,start

" redraw *[\t\n]*
set list
set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:%,eol:↩
" set ambiguous characters as double
set ambw=double
set wildmenu
" show linenumber
set number
set cursorcolumn
set cursorline
set shell=$SELL
set timeoutlen=250
set display=uhex

" set completion
set omnifunc=syntaxcomplete#Complete

" Statusline settings
" shown as  ->  [file:"*FILENAME*[*EDIT FLAG*]"|Type:"*FILETYPE*"|Enc:"*ENCODING*"] L*CURRENT LINE*/*FILE LINE NUMBER* *CURRENT COLUMN*
set statusline=[file:\"%t%m\"\|Type:\"%Y\"\|%{'Enc:\"'.(&fenc!=''?&fenc:&enc).'\"]'}\ %h%w\L%l\/%L\ %v
set laststatus=2

set shellslash
" ------ }


" ---colorscheme--- {
colorscheme default
" ------ }


" ---NICE features and functions for defeat SUBJECTS--- {
" for LaTeX{
let g:tex_flavor = "latex"

let java_highlight_all = 1

let java_highlight_debug = 1

let java_highlight_functions = 1

augroup LatexSub
	autocmd!

	autocmd BufWritePre *.tex silent :%s/｡/。/ge

	autocmd BufWritePre *.tex silent :%s/､/、/ge

	autocmd BufWritePre *.tex silent :%s/｢/「/ge

	autocmd BufWritePre *.tex silent :%s/｣/」/ge
augroup END
" }

" highlight Zenkaku-space {
function! ZenkakuSpace()
	hi ZenkakuSpace cterm=underline ctermbg=196 gui=underline guifg=darkgrey
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!

		autocmd ColorScheme       * call ZenkakuSpace()

		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END

	call ZenkakuSpace()
endif
" }

" insertmode highlight {
" change StatusLine color when entering insertmode
if has('syntax')
	let g:hi_insert = 'StatusLine cterm=reverse,bold ctermfg=0 ctermbg=255'

	let g:hi_normal = ""

	redir => g:hi_normal
	silent! hi StatusLine
	redir END

	let g:hi_normal = substitute(hi_normal, '[\r\n]', '', 'g')

	let g:hi_normal = substitute(hi_normal, 'xxx ', '', '')

	augroup InsertHighlight
		autocmd!

		autocmd InsertEnter * exec 'hi '. g:hi_insert

		autocmd InsertLeave * exec 'hi '. g:hi_normal
	augroup END
endif
" }

" ------ }



" ---syntax--- {
" Java {
if &ft == "java"
	hi link javaMethod Include
	hi link javaBraces Special
	hi link javaClass javaType
	hi link javaScopeDecl Statement
	hi link javaClassDecl Statement
	hi link javaStorageClass Statement


	syn match javaMethod /\<[a-z]\w*\(\s*(.*)\)\@=/
	syn match javaClass /\(class\s\+\)\@<=[A-Z]\w\+/
	syn match javaClass /\(new\s\+\)\@<=[A-Z]\w*/

	autocmd VimEnter *.java syn clear javaFuncDef
	autocmd VimEnter *.java syn match javaClass /\<[A-Z]\w*\(\.\)\@=/
	autocmd VimEnter *.java syn match javaBraces /[()\[\]]/
endif
" }

" C {
if &ft == "c"
	hi link cChar cType
	hi link cFunc cInclude
	hi link cSurround Special

	syn match cChar /[!=%<>+,\(\->\)\-]/
	syn match cChar /\/\(\*\|\/\)\@!/
	syn match cChar /\(\/\)\@<!\*/
	syn match cFunc /\(\<\(\(int\)\|\(void\)\|\(char\)\|\(double\)\|\(float\)\)\s\+\)\@<=\w\+\(\s*(.*)\)\@=/
	syn match cFunc /\<\w\+\>\(\s*(.*)\)\@=/ contains=ALLBUT,cStatement,cLabel,cConditional,cRepeat,cUserLabel,cOperator,cStructure

	autocmd VimEnter *.c,*.cpp syn match cSurround /[(){}\[\]]/
endif
" }
" ------ }

