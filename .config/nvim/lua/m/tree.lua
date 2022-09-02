-- File tree
local g = vim.g
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 4
g.netrw_winsize = 25

-- map('n', '<LEADER>t', ':NvimTreeToggle<CR>', nor)
-- map('n', '<LEADER>fb', ':Telescope file_browser<CR>', nor)
-- require'nvim-tree'.setup {
--   hidden = true,
--   icon_padding = ' ',
--   root_folder_modifier = ':t',
--   -- disables netrw completely
--   disable_netrw = true,
--   -- hijack netrw window on startup
--   hijack_netrw = true,
--   -- open the tree when running this setup function
--   open_on_setup = true,
--   -- will not open on setup if the filetype is in this list
--   ignore_ft_on_setup = {},
--   -- closes neovim automatically when the tree is the last **WINDOW** in the view
--   auto_close = false,
--   -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
--   open_on_tab = false,
--   close_on_open = true,
--   -- hijack the cursor in the tree to put it at the start of the filename
--   hijack_cursor = true,
--   -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
--   update_cwd = false,
--   -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
--   update_focused_file = {
--     -- enables the feature
--     enable = false,
--     -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
--     -- only relevant when `update_focused_file.enable` is true
--     update_cwd = false,
--     -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
--     -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
--     ignore_list = {}
--   },
--   -- configuration options for the system open command (`s` in the tree by default)
--   system_open = {
--     -- the command to run this, leaving nil should work in most cases
--     cmd = nil,
--     -- the command arguments as a list
--     args = {}
--   },
--   view = {
--     side = 'left',
--     hide_root_folder = true
--   }
-- }
