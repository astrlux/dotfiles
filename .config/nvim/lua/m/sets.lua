local o             = vim.opt
o.timeoutlen        = 450
o.number            = true
o.relativenumber    = true
o.cursorline        = true
o.signcolumn        = 'no'
o.showcmd           = false
o.showmode          = false
o.showmatch         = false
o.mouse             = 'a'
o.ruler             = false
o.wrap              = false
o.hidden            = true
o.undofile          = true
o.directory         = '/tmp//'
o.backupdir         = '/tmp//'
o.undodir           = '/tmp//'
o.hlsearch          = false
o.incsearch         = true
o.smartcase         = true
o.ignorecase        = true
o.smarttab          = true
o.expandtab         = true
o.autoindent        = false
o.smartindent       = false
o.laststatus        = 0
o.cmdheight         = 1
o.shiftwidth        = 4
o.softtabstop       = 4
o.tabstop           = 4
o.scrolloff         = 0
o.updatetime        = 50
o.completeopt       = 'menuone,noselect'

vim.api.nvim_exec([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:ver20
    augroup END
]], false)
