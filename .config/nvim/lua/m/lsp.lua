-- Enable local Lua language-server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require 'lspconfig'.sumneko_lua.setup {
    cmd = { 'lua-language-server' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path
            },
            diagnostics = { -- Get language server to recognize `vim` global
                globals = { 'vim' }
            },
            workspace = { -- Make server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            telemetry = { -- Don't send telemetry data containing unique identifier
                enable = false
            }
        }
    }
}

-- require 'lspconfig'.efm.setup {
--     init_options = {
--         documentFormatting = true,
--         codeAction = true
--     },
--     root_dir = require 'lspconfig'.util.root_pattern { '.git/', '.' },
--     filetypes = { 'lua' },
--     settings = {
--         rootMarkers = { '.', '.git/' },
--         languages = {
--             lua = {
--                 {
--                     formatCommand = 'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=80 --break-after-table-lb --indent-width=4 --double-quote-to-single-quote',
--                     formatStdin = true
--                 }
--             }
--         }
--     }
-- }

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    update_in_insert = false
})
local signs = { -- Define diagnostic signs
    Error = '✗',
    Warning = '!',
    Hint = '?',
    Information = 'I'
}
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl
    })
end

local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = {
        noremap = true,
        silent = true
    }
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gd', [[<CMD>lua vim.lsp.buf.definition()<CR>]], opts)
    buf_set_keymap('n', 'gD', [[<CMD>lua vim.lsp.buf.declaration()<CR>]], opts)
    buf_set_keymap('n', 'gr', [[<CMD>lua vim.lsp.buf.references()<CR>]], opts)
    buf_set_keymap('n', 'gi', [[<CMD>lua vim.lsp.buf.implementation()<CR>]],
        opts)
    buf_set_keymap('n', 'gf', [[<CMD>lua vim.lsp.buf.formatting()<CR>]], opts)
    buf_set_keymap('n', 'qr', [[<CMD>lua vim.lsp.buf.rename()<CR>]], opts)
    buf_set_keymap('n', '<C-k>', [[<CMD>lua vim.lsp.buf.signature_help()<CR>]],
        opts)
    buf_set_keymap('n', '<LEADER>cd',
        [[<CMD>lua vim.diagnostic.open_float(0, { scope = "line", border = "rounded", focusable = false  })<CR>]],
        opts)
    buf_set_keymap('n', '<C-n>',
        [[<CMD>lua vim.diagnostic.goto_prev({ float =  { border = "rounded", focusable = false  }})<CR>]],
        opts)
    buf_set_keymap('n', '<C-p>',
        [[<CMD>lua vim.diagnostic.goto_next({ float =  { border = "rounded", focusable = false }})<CR>]],
        opts)
    -- buf_set_keymap('n', '<LEADER>hs', [[<CMD>lua vim.lsp.buf.signature_help()<CR>]], opts)
    buf_set_keymap('n', '<LEADER>ca',
        [[<CMD>lua vim.lsp.buf.code_action({ float =  { border = "rounded", focusable = false }})<CR>]],
        opts)
    buf_set_keymap('n', 'K',
        [[<CMD>lua vim.lsp.buf.hover({ float =  { border = "rounded" }})<CR>]],
        opts)
end


-- coq capabilities
local coq = require 'coq'
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable the following languague servers
local servers = { 'clangd', 'pyright' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 72
        }
    }))
end

vim.api.nvim_exec([[
augroup formatFile
    autocmd!
    autocmd BufWritePre *.lua,*.go,*.cpp,*.js,*.jsx,*.ts,*.tsx,*.rs,*.py,*.hs lua vim.lsp.buf.formatting_sync(nil, 250)
augroup END
" augroup textWordProcessor
"     autocmd!
"     autocmd FileType text setlocal linebreak wrap
"     autocmd BufRead,BufNewFile *.txt setlocal linebreak wrap
" augroup END
" augroup markdownWordProcessor
"     autocmd!
"     autocmd FileType md setlocal linebreak wrap
"     autocmd BufRead,BufNewFile *.md setlocal linebreak wrap
" augroup END
" augroup latexWordProcessor
"     autocmd!
"     autocmd FileType tex setlocal linebreak wrap
"     autocmd BufRead,BufNewFile *.tex setlocal linebreak wrap
" augroup END
" augroup autoHi
"     autocmd!
"     autocmd CursorMoved *.cpp,*.py,*.c,*.go exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" augroup END
]], false)

-- suppress error message from lang server (credit: Pocco81)
vim.notify = function(msg, log_level, _)
    if msg:match('exit code') then return end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
