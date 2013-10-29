" Don't be compatible with vi.
set nocompatible
filetype off

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle manages Vundle. Vundleception!
Bundle 'gmarik/vundle'

Bundle 'PeterRincker/vim-argumentative.git'
Bundle 'itchyny/lightline.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'

" A whole collection of language support files.
Bundle 'sheerun/vim-polyglot'
Bundle 'StanAngeloff/php.vim'

" Tim Pope FTW.
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'

" Scrooloose FTW.
" Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/inkpot'

" Syntaxes and language support
Bundle 'pangloss/vim-javascript'
" Bundle 'tangledhelix/vim-octopress'
" Bundle 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'

" Helpers
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mattn/emmet-vim'
Bundle 'mhinz/vim-signify'
Bundle 'SirVer/ultisnips'

if &termencoding == ""
    let &termencoding = &encoding
endif
set encoding=utf-8

autocmd FileChangedRO * echohl WarningMsg | echo "File changed RO." | echohl None
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None
autocmd BufWritePre * :%s/\s\+$//e

" ############################################################################
" #         Bootstrap my configuration and plugins (with Pathogen)           #
" ############################################################################

" I use vim in four environments: gVim in Windows, MacVim in OS X, and
" terminal vim in various shells (Cygwin, OS X, Ubuntu). The major differences
" between the environments is the way paths are expressed and my own personal
" path preferences for storage of select files. This is the only way I could
" come up with to close that gap efficiently.
if has("gui_win32")
    " This covers Windows GUI only.
    let s:config_prefix = $HOME.'\vimfiles\'
    " Don't load Powerline in Windows because I open a lot of files over
    " network shares and Powerline makes Vim crawl.
    " let g:Powerline_loaded = 1
elseif has("win32unix")
    " This covers the Cygwin terminal, which has POSIX-style paths, but should
    " use the Windows gVim installation for simplicity.
    let s:config_prefix = $HOME.'/vimfiles/'
else
    " This covers everything else, which will include MacVim and any UN*X-like
    " shell.
    let s:config_prefix = '~/.vim/'
endif

" Fix the Solarized mapping.
"call togglebg#map("")

" Now enable syntax highlighting and filetype stuff.
syntax on

" Enable filetype handling.
filetype plugin indent on

" Now process all of the configuration files that I have stored in my 'config'
" directory, which significantly cleans up this file.
for filename in sort(split(glob(s:config_prefix.'config/*.vim'), '\n'))
    execute 'source '.filename
endfor

" vim: set et ts=4 sw=4 :

" set background=dark
"let g:solarized_termcolors=256
" colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""
" Functionality
""""""""""""""""""""""""""""""""""""""""""""""""
" set console title to open file name
set title
" ignore case during searches unless capitals are used
set ignorecase smartcase
" BASH-style tab completion for filenames
set wildmenu wildmode=longest:full
" disables the bell noise and removes any associated delay
set noerrorbells visualbell t_vb=
" allow switching files and buffers without saving
set hidden
" allow backspacing over everything
set backspace=indent,eol,start
" don't put cursor at the start of the line unneccessarily
set nostartofline
" enable folding by indentation level by default
set foldmethod=marker foldminlines=3 foldlevel=99
" automatically insert leading comment characters when pressing <enter> in insert mode
set formatoptions+=r
" don't insert leading comment characters when pressing `o` or `O` in normal mode
set formatoptions-=o
" keep 50 commands in history
set history=50

""""""""""""""""""""""""""""""""""""""""""""""""
" Display
""""""""""""""""""""""""""""""""""""""""""""""""
" show command being entered
set showcmd
" do not wrap long lines of text
set wrap
" always show cursor
set ruler
" highlight the cursor's line
set cursorline
" highlight the cursor's column
" set cursorcolumn
" flash matching bracket on insert
set showmatch
" search as you type
set incsearch
" global search/replace by default
set gdefault
" highlight matched search pattern
set hlsearch
" keep cursor away from vertical edge of terminal
set scrolloff=1
" always display the status bar
set laststatus=2
" use :set list! to toggle visible whitespace on/off
set listchars=tab:\¦.,nbsp:\.,trail:\·,eol:\.,extends:\»,precedes:\«


""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""
" auto-indent
set noautoindent smartindent
" two-character-wide tabs
set expandtab
set tabstop=2
set shiftwidth=2


" flag problematic whitespace (trailing spaces and spaces before tabs)
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$\|[^\t]\zs\t\+\|\t\zs \+/ "\zs sets start of match so only tabs highlighted

" highlight TODO notes
highlight Todo ctermfg=darkgrey ctermbg=yellow

" <tab> indents in visual mode
vmap <tab> >
vmap <s-tab> <
" <tab><tab> indents without visual selection
nmap <tab><tab> >>
nmap <s-tab><s-tab> <<

nnoremap <space> :nohlsearch<return>

" :clean to remove trailing whitespace
cnoreabbrev clean %s/\s\+$//
" :format to auto-format
cnoreabbrev format %s/[\r \t]\+$//<return>:%s/\([\r\n]\)[\r\n]\+/\1\1/<return>:nohlsearch<return>m'ggVG=`'
