local to_ignore = {
    '.git',
    '.local',
}
require('telescope').setup({
    defaults = {
        file_ignore_patterns = to_ignore,
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        -- color_devicons = true,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        layout_config = { -- place preview on top
            flex = {
                flip_columns = 720 -- remove preview under these columns
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will perform exact matches
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = 'smart_case' -- or 'ignore_case' or 'respect_case'
        }
    }
})

-- load extensions after setup
require 'telescope'.load_extension 'fzf'

local M = {}
M.search_dotfiles = function()
    print(vim.env.DOTFILES)
    require('telescope.builtin').find_files({
        prompt_title = 'dotfiles',
        cwd = vim.env.DOTFILES,
        hidden = true
    })
end
return M
