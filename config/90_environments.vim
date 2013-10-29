"____Environment-specific locations____
" I only use these backup locations in Windows

if has("gui_running")
    " All GUI settings -------------------------------------------------------

    " I only use Solarized in the GUI, so configure it here.
    set background=light
    let g:solarized_underline=0         "default value is 1
    let g:solarized_visibility="low"    "default value is normal
    colorscheme solarized

    " No menu nor toolbar.
    set guioptions-=m
    set guioptions-=T

    " Always show the tab bar.
    set showtabline=2

    if has("gui_win32")
        " Windows Settings ---------------------------------------------------
        if !filewritable("c:\\vim_backups")
            call mkdir("c:\\vim_backups")
        endif
        set backupdir=c:\\vim_backups
        set dir=c:\\vim_backups
        let g:Reference_File_Location='u:\reference'
        let g:Todo_List_Location='u:\TODO.txt'

        nmap <leader>o :exec "silent !start explorer.exe ".expand("%:h")<CR>

        if v:version > 702
            " Only for versions above 7.2 where these features are available.
            if !filewritable("c:\\vim_undo")
                call mkdir("c:\\vim_undo")
            endif
            set undodir=c:\\vim_undo
        endif
    elseif has("gui_macvim")
        " Mac GUI Settings ---------------------------------------------------
        set guifont=Source\ Code\ Pro\ for\ Powerline:h13

        if !filewritable("/tmp/vim_backups")
            call mkdir("/tmp/vim_backups")
        endif
        set backupdir=/tmp/vim_backups
        set dir=/tmp/vim_backups

        if v:version > 702
            " Only for versions above 7.2 where these features are available.
            if !filewritable("/tmp/vim_undo")
                call mkdir("/tmp/vim_undo")
            endif
            set undodir=~/tmp/vim_undo
        endif
    elseif has("gui_gtk")
        " Linux GUI (GTK+) Settings ------------------------------------------
        if !filewritable("/tmp/vim_backups")
            call mkdir("/tmp/vim_backups")
        endif
        set backupdir=/tmp/vim_backups
        set dir=/tmp/vim_backups

        if v:version > 702
            " Only for versions above 7.2 where these features are available.
            if !filewritable("/tmp/vim_undo")
                call mkdir("/tmp/vim_undo")
            endif
            set undodir=~/tmp/vim_undo
        endif

        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'

        let g:Reference_File_Location='~/u/reference'
        let g:Todo_List_Location='~/Dropbox/TODO.txt'
    else
        " All other GUIs Settings --------------------------------------------
        set guifont=DejaVu\ Sans\ Mono:h10
        "set guifont=Consolas:h11
        "set guifont=Tamsyn8x15
        "set guifont=Inconsolata-dz:h9
    endif
else
    " All console-specific settings. -----------------------------------------
   "" colorscheme xoria256
    set background=dark
    let g:solarized_underline=0         "default value is 1
    let g:solarized_visibility="normal"    "default value is normal
    colorscheme solarized


    if !filewritable("/tmp/vim_backups")
        call mkdir("/tmp/vim_backups")
    endif
    set backupdir=/tmp/vim_backups
    set dir=/tmp/vim_backups
    "let g:Reference_File_Location='~/u/reference'
    "let g:Todo_List_Location='~/Dropbox/TODO.txt'

    if v:version > 702
        " Only for versions above 7.2 where these features are available.
        if !filewritable("/tmp/vim_undo")
            call mkdir("/tmp/vim_undo")
        endif
        set undodir=~/tmp/vim_undo
    endif
endif

" vim: set et ts=4 sw=4 :
