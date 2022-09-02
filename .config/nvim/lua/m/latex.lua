-- LaTeX live preview
vim.api.nvim_exec([[ 
  augroup LaTeXCompiler
    autocmd FileType tex nnoremap <buffer> <F5> :!lualatex % && open -a Preview %:r.pdf && open -a kitty<CR>
  augroup END
]], false)

-- Markdown to PDF preview
vim.api.nvim_exec([[ 
  augroup MarkdownToPDF
    autocmd FileType markdown nnoremap <buffer> T :silent !pandoc % -o compiled.pdf && open -a Preview && open -a kitty<CR>
  augroup END
]], false)
