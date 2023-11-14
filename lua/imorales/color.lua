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
    maroon = '#d75f87',
    dark   = '#262626',
    grey   = '#A7A7A7',
}

local theme = {
    ['background']  = gradient[1],
    ['function']    = '#87D7FF', -- blue
    ['variable']    = '#EEEEEE', -- white
    ['keyword']     = '#FF5F5F', -- red
    ['string']      = '#FFFFD7', -- yellow
    ['number']      = '#F1BC7E', -- orange
    ['class']       = '#AFAFFF', -- purple
    ['type']        = '#AFD7AF', -- green
    ['bool']        = '#FFAFFF', -- pink
    ['misc']        = '#87AFAF', -- teal
    ['other']       = '#d75f87', -- maroon
    ['punctuation'] = gradient[6],
}

local git = {
    new = "#AFFFAF",
}

local icons = {
    leaf = '󰌪',
    owl = '',
    matrix = '',
    etch = '',
    sine = '󰥛',
    cosine = '󱑹',
    arrow = { left = '', right = '' },
    chevron = { left = '', right = '' },
    circle = {
        half    = { left = '', right = '' },
        chevron = { left = '', right = '' },
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
    ['GitGutterChange']             = { guibg = gradient[2], guifg = theme['number'] },
    ['GitGutterDelete']             = { guibg = gradient[2], guifg = theme['keyword'] },
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
    ['NvimTreeGitDirty']            = { guifg = theme['number'] },
    ['NvimTreeGitStaged']           = { guifg = theme['number'] },
    ['NvimTreeGitMerge']            = { guifg = theme['misc'] },
    ['NvimTreeGitRenamed']          = { guifg = theme['number'] },
    ['NvimTreeGitNew']              = { guifg = git.new },
    ['NvimTreeGitDeleted']          = { guifg = theme['keyword'] },
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
    ['@lsp.type.type.rust']         = { guifg = theme['type'] },
    ['@lsp.type.interface.rust']    = { guifg = theme['type'] },
    ['@lsp.type.struct.rust']       = { guifg = theme['type'] },
    ['@lsp.type.enum.rust']         = { guifg = theme['type'] },
    ['@lsp.type.enumMember.rust']   = { guifg = theme['number'] },
    ['@constant.builtin.rust']      = { guifg = theme['number'] },
    ['@storageclass.lifetime.rust'] = { guifg = theme['misc'] },
    ['@function.macro.rust']        = { guifg = theme['other'] },
    -- python
    ['@attribute.python']           = { guifg = theme['class'] },
    ['@attribute.builtin.python']   = { guifg = theme['class'] },
    -- css
    ['@type.css']                   = { guifg = theme['keyword'] },
    ['@type.scss']                  = { guifg = theme['keyword'] },
    -- lua
    ['@constructor.lua']            = { guifg = theme['punctuation'] },
    -- typescript
    ['@type.typescript']            = { guifg = theme['type'] },
}

local function setup()
    local colorscheme = require('base16-colorscheme')
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

    require('nvim-web-devicons').setup()

    require('lualine').setup({
        options = {
            theme                = 'base16',
            component_separators = '',
            section_separators   = '',
            globalstatus         = true,
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    separator = {
                        left  = '',
                        right = icons.circle.half.right,
                    }
                },
            },
            lualine_b = {
                {
                    'branch',
                    icon = '',
                    separator = {
                        left  = '',
                        right = icons.circle.half.right,
                    },
                },
                {
                    'diff',
                    diff_color = {
                        added    = 'GitGutterAdd',
                        modified = 'GitGutterChange',
                        removed  = 'GitGutterDelete',
                    },
                }
            },
            lualine_c = {
                {
                    'filename',
                    align = 'left'
                }
            },
            lualine_x = {},
            lualine_y = {
                {
                    'filetype',
                    separator = {
                        left  = icons.circle.half.left,
                        right = '',
                    }
                }
            },
            lualine_z = {
                {
                    'location',
                    separator = {
                        left  = icons.circle.half.left,
                        right = '',
                    }
                }
            },
        }
    })

    for group, color in pairs(colors) do
        colorscheme.highlight[group] = color
    end
end

return setup()
