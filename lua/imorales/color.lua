local gradient = {
    "#262626", -- darkest
    "#353535",
    "#444444",
    "#626262",
    "#808080",
    "#A7A7A7",
    "#9E9E9E",
    "#AFAFAF", -- lightest
}

local pallete = {
    blue   = '#87D7FF',
    white  = '#EEEEEE',
    red    = '#FF5F5F',
    yellow = '#FFFFD7',
    orange = '#F1BC7E',
    purple = '#AFAFFF',
    green  = '#AFD7AF',
    pink   = '#FFAFFF',
    teal   = '#87AFAF',
    maroon = '#D75F87',
}

local theme = {
    ['function']    = pallete.blue,
    ['variable']    = pallete.white,
    ['keyword']     = pallete.red,
    ['string']      = pallete.yellow,
    ['number']      = pallete.orange,
    ['class']       = pallete.purple,
    ['type']        = pallete.green,
    ['bool']        = pallete.pink,
    ['misc']        = pallete.teal,
    ['other']       = pallete.maroon,
    ['background']  = gradient[1],
    ['punctuation'] = gradient[6],
}

local git = {
    new     = "#AFFFAF",
    merge   = pallete.teal,
    staged  = pallete.maroon,
    changed = pallete.orange,
    deleted = pallete.red,
}

local icons = {
    leaf    = '󰌪',
    owl     = '',
    matrix  = '',
    etch    = '',
    sine    = '󰥛',
    cosine  = '󱑹',
    branch  = '',
    arrow   = { left = '', right = '' },
    chevron = { left = '', right = '' },
    circle  = {
        half    = { left = '', right = '' },
        chevron = { left = '', right = '' },
    },
}

local widgets = {
    mode     = {
        'mode',
        separator = {
            left  = '',
            right = icons.circle.half.right,
        }
    },
    branch   = {
        'branch',
        icon = icons.branch,
        separator = {
            left  = '',
            right = icons.circle.half.right,
        },
    },
    diff     = {
        'diff',
        diff_color = {
            added    = 'GitGutterAdd',
            modified = 'GitGutterChange',
            removed  = 'GitGutterDelete',
        },
    },
    filename = {
        'filename',
        align = 'left'
    },
    filetype = {
        'filetype',
        separator = {
            left  = icons.circle.half.left,
            right = '',
        }
    },
    location = {
        'location',
        separator = {
            left  = icons.circle.half.left,
            right = '',
        }
    },
}

local colors = {
    --
    -- base16 color scheme
    --
    ['VertSplit']                   = { guifg = gradient[1] },
    ['WinSeparator']                = { guifg = gradient[1] },
    ["Search"]                      = { guifg = gradient[1], guibg = gradient[8] },
    ["Substitute"]                  = { guifg = gradient[1], guibg = gradient[8] },
    ["@include"]                    = '@keyword',
    ["@operator"]                   = '@keyword',
    ["@tag"]                        = '@keyword',
    ["@exception"]                  = '@keyword',
    ['@type']                       = '@variable',
    ['@field']                      = '@variable',
    ['@property']                   = '@variable',
    ['@attribute']                  = '@variable',
    ['@boolean']                    = { guifg = theme['bool'] },
    ['@constant.builtin']           = { guifg = theme['bool'] },
    ['@type.declaration']           = { guifg = theme['type'] },
    ['@type.definition']            = { guifg = theme['type'] },
    ['@type.builtin']               = { guifg = theme['class'] },
    ["@tag.attribute"]              = { guifg = theme['class'] },
    ["@tag.delimiter"]              = { guifg = theme['punctuation'] },
    ['@punctuation']                = { guifg = theme['punctuation'] },
    ["@punctuation.delimiter"]      = { guifg = theme['punctuation'] },
    ["@punctuation.bracket"]        = { guifg = theme['punctuation'] },
    ['@variable.builtin']           = { guifg = theme['punctuation'], gui = 'italic' },
    --
    -- lualine
    --
    ['GitGutterAdd']                = { guibg = gradient[2], guifg = git.new },
    ['GitGutterChange']             = { guibg = gradient[2], guifg = git.changed },
    ['GitGutterDelete']             = { guibg = gradient[2], guifg = git.deleted },
    --
    -- telescope
    --
    ['TelescopePromptNormal']       = { guibg = 'none' },
    ['TelescopePromptBorder']       = { guibg = 'none' },
    ['TelescopePromptPrefix']       = { guibg = 'none' },
    ['TelescopePromptTitle']        = { guibg = theme['string'], guifg = 'none' },
    ['TelescopeBorder']             = { guifg = theme['punctuation'] },
    --
    -- nvim-tree
    --
    ['NvimTreeImageFile']           = { guifg = gradient[4], guibg = 'none' },
    ['NvimTreeSpecialFile']         = { guifg = gradient[4], guibg = 'none' },
    ['NvimTreeRootFolder']          = { guifg = gradient[4], guibg = 'none' },
    ['NvimTreeFolderName']          = { guifg = gradient[4], guibg = 'none' },
    ['NvimTreeEmptyFolderName']     = { guifg = gradient[4], guibg = 'none' },
    ['NvimTreeOpenedFolderName']    = { guifg = theme['punctuation'] },
    ['NvimTreeFolderIcon']          = { guifg = theme['punctuation'] },
    ['NvimTreeIndentMarker']        = { guifg = theme['punctuation'] },
    ['NvimTreeIndentMarkerIcon']    = { guifg = theme['punctuation'] },
    ['NvimTreeGitNew']              = { guifg = git.new },
    ['NvimTreeGitNewIcon']          = { guifg = git.new },
    ['NvimTreeGitMerge']            = { guifg = git.merge },
    ['NvimTreeGitMergeIcon']        = { guifg = git.merge },
    ['NvimTreeGitStaged']           = { guifg = git.staged },
    ['NvimTreeGitStagedIcon']       = { guifg = git.staged },
    ['NvimTreeGitDirty']            = { guifg = git.changed },
    ['NvimTreeGitDirtyIcon']        = { guifg = git.changed },
    ['NvimTreeGitRenamed']          = { guifg = git.changed },
    ['NvimTreeGitRenamedIcon']      = { guifg = git.changed },
    ['NvimTreeGitDeleted']          = { guifg = git.deleted },
    ['NvimTreeGitDeletedIcon']      = { guifg = git.deleted },
    --
    -- semantic tokens
    --
    ['@lsp.type.class']             = { guifg = theme['variable'] },
    ['@lsp.type.decorator']         = { guifg = theme['other'] },
    ['@lsp.type.enum']              = { guifg = theme['variable'] },
    ['@lsp.type.enumMember']        = { guifg = theme['type'] },
    ['@lsp.type.function']          = { guifg = theme['function'] },
    ['@lsp.type.interface']         = { guifg = theme['type'] },
    ['@lsp.type.macro']             = { guifg = theme['other'] },
    ['@lsp.type.method']            = { guifg = theme['function'] },
    ['@lsp.type.namespace']         = { guifg = theme['variable'] },
    ['@lsp.type.struct']            = { guifg = theme['variable'] },
    ['@lsp.type.type']              = { guifg = theme['variable'] },
    ['@lsp.type.typeParameter']     = { guifg = theme['variable'] },
    ['@lsp.type.variable']          = { guifg = theme['variable'] },
    --
    -- language specific
    --
    -- rust
    ['@type.rust']                  = { guifg = theme['variable'] },
    ['@lsp.type.type.rust']         = { guifg = theme['type'] },
    ['@lsp.type.interface.rust']    = { guifg = theme['type'] },
    ['@lsp.type.struct.rust']       = { guifg = theme['class'] },
    ['@lsp.type.enum.rust']         = { guifg = theme['class'] },
    ['@lsp.type.enumMember.rust']   = { guifg = theme['number'] },
    ['@function.macro.rust']        = { guifg = theme['other'] },
    ['@constant.builtin.rust']      = { guifg = theme['number'] },
    ['@storageclass.lifetime.rust'] = { guifg = theme['misc'] },
    ['@lsp.type.lifetime.rust']     = { guifg = theme['misc'] },
    -- lua
    ['@constructor.lua']            = { guifg = theme['punctuation'] },
    -- css
    ['@type.css']                   = { guifg = theme['keyword'] },
    ['@type.scss']                  = { guifg = theme['keyword'] },
    -- python
    ['@attribute.python']           = { guifg = theme['class'] },
    ['@attribute.builtin.python']   = { guifg = theme['class'] },
    -- typescript
    ['@type.typescript']            = { guifg = theme['type'] },
    ['@attribute.typescript']       = { guifg = theme['misc'] },
}

local function setup()
    local devicons = require('nvim-web-devicons')
    local statusbar = require('lualine')
    local colorscheme = require('base16-colorscheme')

    -- setup custom base16 color scheme
    colorscheme.setup({
        base00 = gradient[1],
        base01 = gradient[2],
        base02 = gradient[3],
        base03 = gradient[4],
        base04 = gradient[5],
        base05 = gradient[6],
        base06 = gradient[7],
        base07 = gradient[8],
        base08 = theme['variable'],
        base09 = theme['number'],
        base0A = theme['class'],
        base0B = theme['string'],
        base0C = theme['misc'],
        base0D = theme['function'],
        base0E = theme['keyword'],
        base0F = theme['type'],
    })
    -- setup icons for dependents (inherit defaults from color scheme)
    devicons.setup()
    -- setup status bar with base16 color scheme (inherit defualts from color scheme)
    statusbar.setup({
        options = {
            theme                = 'base16',
            globalstatus         = true,
            component_separators = '',
            section_separators   = '',
        },
        sections = {
            lualine_a = { widgets.mode },
            lualine_b = { widgets.branch, widgets.diff },
            lualine_c = { widgets.filename },
            lualine_x = {},
            lualine_y = { widgets.filetype },
            lualine_z = { widgets.location },
        }
    })
    -- apply custom base16 color scheme overrides
    for group, color in pairs(colors) do
        colorscheme.highlight[group] = color
    end
end

return setup()
