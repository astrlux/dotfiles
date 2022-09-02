require('material').setup({
    contrast = {
        sidebars = true, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = false, -- Enable contrast for floating windows
        line_numbers = false, -- Enable contrast background for line numbers
        sign_column = false, -- Enable contrast background for the sign column
        cursor_line = false, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        popup_menu = true -- Enable lighter background for the popup menu
    },
    popup_menu = 'dark', -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )
    italics = {
        comments = true, -- Enable italic comments
        keywords = false, -- Enable italic keywords
        functions = false, -- Enable italic functions
        strings = true, -- Enable italic strings
        variables = false -- Enable italic variables
    },
    contrast_windows = { -- Specify which windows get the contrasted (darker) background
        'terminal', -- Darker terminal background
        'packer', -- Darker packer background
        'qf', -- Darker qf list background
        'NvimTree'
    },
    high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = false -- Enable higher contrast text for darker style
    },
    disable = {
        background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = true, -- Hide the end-of-buffer lines
        borders = true
    },
    custom_highlights = {
        Pmenu = {
            bg = '#282828'
        },
        PmenuSel = {
            bg = '#0C3953'
        },
        MatchParen = {
            fg = 'orange',
            bg = '#444444'
        },
        TelescopeSelection = {
            bg = 'NONE'
        },
        TelescopeMatching = {
            fg = 'orange'
        },
        Visual = {
            bg = '#0C3953'
        },
        ErrorMsg = {
            fg = 'red',
            bg = '#330000'
        },
        diffAdded = {
            fg = '#0EFF00',
            bg = '#013220'
        },
        diffRemoved = {
            fg = 'red',
            bg = '#330000'
        },
        DiagnosticSignWarn = {
            fg = 'orange'
        },
        DiagnosticVirtualTextWarn = {
            fg = 'orange',
            bg = '#4D2A00'
        },
        DiagnosticSignHint = {
            fg = '#e6e600'
        },
        DiagnosticFloatingHint = {
            fg = '#e6e600'
        },
        DiagnosticVirtualTextHint = {
            fg = '#E6E600',
            bg = '#4D2A00'
        },
        DiagnosticSignInformation = {
            fg = 'purple'
        },
        DiagnosticFloatingInformation = {
            fg = 'purple'
        },
        DiagnosticVirtualTextInformation = {
            fg = '#301934'
        },
        DiagnosticSignError = {
            fg = 'red'
        },
        DiagnosticFloatingError = {
            fg = 'red'
        },
        DiagnosticVirtualTextError = {
            fg = 'red',
            bg = '#330000'
        }
    }
})
g.material_style = 'darker'
cmd 'colorscheme material'
