" Detect SAU language files used by saugns
augroup filetypedetect_sau
  autocmd!
  autocmd BufRead,BufNewFile *.sau set filetype=sau
augroup END

