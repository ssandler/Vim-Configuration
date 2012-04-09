"____Filetype preferences____
" Set some other options for ColdFusion files.
autocmd FileType cf set formatoptions=croql textwidth=180
autocmd FileType cf nnoremap p ]p
autocmd FileType cf nnoremap P ]P
autocmd BufRead,BufNewFile *.txt setfiletype text
autocmd BufRead,BufNewFile *.wiki setfiletype wiki
autocmd BufEnter * lcd %:p:h
autocmd FileType markdown set tw=78 colorcolumn=80

" This will cause VIM to automatically enter 'binary' mode when writing files
" that are in /custom_tags/ so that they will be saved without a terminating
" linebreak (at the end of the file). :h binary for more information.
autocmd BufWritePre */custom_tags/*.cfm	setl binary noeol
autocmd BufWritePost */custom_tags/*.cfm	setl nobinary eol

" Use smart indention on CSS files, because I like it.
autocmd FileType css set smartindent
" Use smart indention on PHP files, too.
autocmd FileType php set smartindent
" And in PERL for chrissake.
autocmd FileType perl set smartindent
" And in goddamned ColdFusion mother of god.
autocmd FileType cf set smartindent
" Wouldn't you think we'd smart indent in JavaScript for the love of god?
autocmd FileType javascript set smartindent noautoindent nocindent
autocmd FileType xhtml inoremap <S-CR> <br />
autocmd FileType cf inoremap <S-CR> <br />
autocmd FileType ruby set ts=2 sw=2 autoindent expandtab cinkeys-=0# nosmartindent
autocmd FileType vim set ts=4 sw=4
autocmd FileType python set expandtab ts=2 sw=2
