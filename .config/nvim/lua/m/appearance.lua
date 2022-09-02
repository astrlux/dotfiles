local o, cmd    = vim.opt, vim.cmd
o.termguicolors = true
o.background    = 'dark'
require'dracula'.setup({
    transparent_bg = true
})
vim.cmd 'colorscheme dracula'
