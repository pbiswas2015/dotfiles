
" In normal mode, pressing numpad's+ increases the font
noremap <kPlus> :call AdjustFontSize(1)<CR>
noremap <kMinus> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a
