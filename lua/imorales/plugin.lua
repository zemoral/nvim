---------------
-- telescope --
---------------
require('telescope').setup({
    extensions = {
        fzf = {
            fuzzy                   = true,
            override_file_sorter    = true,
            override_generic_sorter = true,
        }
    }
})

require('telescope').load_extension('fzf')

----------------
-- treesitter --
----------------
require('nvim-treesitter.configs').setup({
    auto_install          = true,
    highlight             = { enable = true },
    textobjects           = { enable = true },
    incremental_selection = { enable = true,
        keymaps = {
            init_selection    = "gnn",
            node_incremental  = "grn",
            scope_incremental = "grc",
            node_decremental  = "grm",
        },
    },
})

---------------
-- nvim-tree --
---------------
require('nvim-tree').setup({
    view = {
        width = 22
    },
    renderer = {
        icons = {
            git_placement = 'before',
            show = {
                git = true,
                file = false,
                folder = false,
            },
            glyphs = {
                folder = {
                    default    = ' ',
                    open       = ' ',
                    empty      = ' ',
                    empty_open = ' ',
                },
                git = {
                    unstaged  = '',
                    staged    = '',
                    unmerged  = '',
                    renamed   = '',
                    untracked = '',
                    deleted   = '',
                    ignored   = '',
                }
            },
        }
    },
    filters = {
        git_ignored = false,
        custom = {
            ".git",
            "node_modules",
        },
    },
    git = {
        show_on_dirs = false,
        show_on_open_dirs = false,
    }
})
