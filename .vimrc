" .vimrc

" turn off strict vi compatibility
set nocompatible

" editor appearance and behavior options
set laststatus=2 " always show status bar
set ruler        " show ruler in status bar
set backspace=2  " backspace over everything
set number       " line numbering
set wrap         " wrap by default
"set visualbell   " no beeps
set incsearch    " incremental searching
set hlsearch   " don't highlight search terms
set guifont=Menlo:h18
"set guifont=Bitstream\ Vera\ Sans\ Mono:h14
"set guifont=De\ Ja\ Vu\ Vera:h14
" Print preferences:
set printoptions=number:n,left:2pc,top:2pc,right:2pc,bottom:2pc,paper:a4
"set printoptions=number:y,left:2pc,top:2pc,right:2pc,bottom:2pc,paper:a4

" tab and wordwrap handling
set nolinebreak tw=0          " don't do any line wrapping
set ts=2 sw=2 sts=2 expandtab " tabs = 2 spaces

set autoindent
filetype indent plugin on
syntax on
colorscheme koehler
"colorscheme desert

if !exists("loaded") && !exists("skip_autocmds")
        let loaded = 1

        " filetype specific options
        au BufEnter *     source <sfile>
        au BufEnter *.txt set tw=72 linebreak
        au BufEnter *.php set cin wrap
endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%80v.\+/

" Code (un)folding using <space>
function! MyToggleFold()
  if foldlevel('.') == 0
    " No fold exists at the current line,
    " so create a fold based on braces
    let x = line('.')    " the current line number
    normal 0
    call search("{")
    normal %
    let y = line('.')    " the current line number
    " Create the fold from x to y
    execute x . "," . y . " fold"
    else
    " Delete the fold on the current line
    normal zd
  endif
endfunction
nmap <space> :call MyToggleFold()<CR>
" Pathogen
execute pathogen#infect()

" For completion
let g:deoplete#enable_at_startup = 1

" eof
