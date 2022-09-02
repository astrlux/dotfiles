local map = vim.api.nvim_set_keymap
local nor = {
    noremap = true,
    silent = true
}
vim.g.mapleader = ' '
-- Esc into normal mode faster
map('i', 'kj', '<Esc>', nor)
map('i', 'jk', '<Esc>', nor)
map('i', '<C-s>', '<Esc>:w<CR>', nor)
map('n', '<C-s>', ':w<CR>', nor)
-- Manage plugins faster
map('n', '<LEADER>1', ':luafile %<CR>', nor)
map('n', '<LEADER>2', ':PackerUpdate<CR>', nor)
map('n', '<LEADER>3', ':PackerInstall<CR>', nor)
map('n', '<LEADER>4', ':PackerClean<CR>', nor)
-- Indent visual mode
map('v', '<', '<gv', nor)
map('v', '>', '>gv', nor)
map('i', '{<CR>', '{<CR>}<ESC><S-O>', nor)
-- Move cursor faster
map('n', '<DOWN>', '9j', nor)
map('v', '<DOWN>', '9j', nor)
map('n', '<UP>', '9k', nor)
map('v', '<UP>', '9k', nor)
-- Switch between splits intuitively
map('n', '<LEADER>h', ':wincmd h<CR>', nor)
map('n', '<LEADER>j', ':wincmd j<CR>', nor)
map('n', '<LEADER>k', ':wincmd k<CR>', nor)
map('n', '<LEADER>l', ':wincmd l<CR>', nor)
-- Switch between buffers
map('', '<C-l>', ':bnext<CR>', nor)
map('', '<C-h>', ':bprev<CR>', nor)
-- Save files faster
map('n', '<LEADER>w', ':w<CR>', nor)
map('n', '<LEADER>q', ':q<CR>', nor)
-- Show timestamped undo history
map('n', '<LEADER>u', ':UndotreeShow<CR>', nor)
-- Paste smoothly
map('v', '<LEADER>p', '"_dP', nor)
-- Yank into clipboard
map('n', '<LEADER>y', '"+y', nor)
map('v', '<LEADER>y', '"+y', nor)
map('n', '<LEADER>Y', 'gg"+yG', nor)
-- Delete elegantly
map('n', '<LEADER>d', '"_d', nor)
map('v', '<LEADER>d', '"_d', nor)
-- Drag lines up & down
map('v', 'J', ':m \'>+1<CR>gv=gv', nor)
map('v', 'K', ':m \'<-2<CR>gv=gv', nor)
-- Fuzzy Finder
map('n', '<LEADER>pp', [[<CMD>lua require'telescope.builtin'.builtin{}<CR>]],
    nor)
map('n', '<LEADER>sf', ':Telescope find_files<CR>', nor)
map('n', '<LEADER>sl', ':Telescope live_grep<CR>', nor)
map('n', '<LEADER>sg', ':Telescope git_files<CR>', nor)
map('n', '<LEADER>so', [[<CMD>lua require('telescope.builtin').oldfiles()<CR>]],
    nor)
map('n', '<LEADER>sh',
    [[<CMD>lua require('telescope.builtin').help_tags()<CR>]], nor)
map('n', '<LEADER>sd', [[<CMD>lua require('m.finder').search_dotfiles()<CR>]],
    nor)
map('n', '<LEADER>ds', [[<CMD>lua require('m.finder').search_dotfiles()<CR>]],
    nor)
map('n', '<LEADER>/',
    [[<CMD>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>]], nor)
map('n', '<LEADER>cs',
    [[<CMD>lua require'telescope.builtin'.colorscheme{}<CR>]], nor)
map('n', '<LEADER>b', [[<CMD>lua require('telescope.builtin').buffers()<CR>]],
    nor)
-- File tree
map('n', '<LEADER>t', ':Lexplore<CR>', nor)
-- map('n', '<LEADER>abc<CR>', 'iabcdefghijklmnopqrstuvwxyz<Esc>', nor)
map('n', '<LEADER>abc<CR>',
    'i#include "/Users/astrlux/stdc++.h"<CR>using namespace std;<Esc>o', nor)
map('n', '<LEADER>pn',
    ':silent !pushd ~/notes; git add .; git commit -am \'changes\'; git push; popd;<CR>',
    nor)
