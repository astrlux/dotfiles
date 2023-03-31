local o, cmd    = vim.opt, vim.cmd
o.termguicolors = true
o.background    = 'dark'
require'dracula'.setup({
    transparent_bg = true,
    italic_comment = true,
})
vim.api.nvim_exec([[
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup END
"augroup ChangeBackgroudColour
"    autocmd colorscheme * :hi normal guibg=none
"augroup END
]], false)
cmd 'colorscheme dracula'
