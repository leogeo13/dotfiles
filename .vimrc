set number
set tabstop=4
syntax on

"--add indent lines--
let g:indentLine_defaultGroup = 'SpecialKey'

let g:user_emmet_leader_key=','
inoremap <nowait> jk <Esc>:w<CR>

map <F2> :NERDTreeToggle<CR>

"--fill CSS--
filetype plugin on
set omnifunc=syntaxcomplete#Complete


"--adding eldar color--
if has('syntax')
	set background=dark
	syntax enable
	silent! colorscheme lunaperche
endif
