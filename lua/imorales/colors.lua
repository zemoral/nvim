require('imorales.treesitter')

local gradient = {
    "#262626", -- darkest
    "#353535",
    "#444444",
    "#626262",
    "#808080",
    "#9E9E9E",
    "#A7A7A7",
    "#AFAFAF", -- lightest
}

local theme = {
    ['background']  = gradient[1],
    ['variable']    = '#EEEEEE', -- white
    ['function']    = '#87D7FF', -- blue
    ['keyword']     = '#FF5F5F', -- red
    ['string']      = '#FFFFD7', -- yellow
    ['number']      = '#F1BC7E', -- orange
    ['class']       = '#AFAFFF', -- purple
    ['type']        = '#AFFFAF', -- green
    ['bool']        = '#FFAFFF', -- pink
    ['misc']        = '#87AFAF', -- teal
    ['punctuation'] = gradient[6],
}

local colors = {
    ["Search"]     = { guibg = gradient[8], guifg = gradient[1] },
    ["Substitute"] = { guibg = gradient[8], guifg = gradient[1] },

    ["@include"]  = '@keyword',
    ["@operator"] = '@keyword',
    ["@tag"]      = '@keyword',

    ['@type']      = '@variable',
    ['@field']     = '@variable',
    ['@property']  = '@variable',
    ['@parameter'] = '@variable',

    ["@tag.delimiter"]         = { guifg = theme['punctuation'] },
    ["@punctuation.delimiter"] = { guifg = theme['punctuation'] },
    ["@punctuation.bracket"]   = { guifg = theme['punctuation'] },
    ['@variable.builtin']      = { guifg = theme['punctuation'], gui = 'italic' },

    ['@type.builtin']     = { guifg = theme['class'], gui = 'none' },
    ['@type.definition']  = { guifg = theme['type'] },
    ['@type.declaration'] = { guifg = theme['type'] },

    ['@boolean']          = { guifg = theme['bool'] },
    ['@constant.builtin'] = { guifg = theme['bool'] },

    --
    -- plugins
    --

    -- lua line
    ['GitGutterAdd']    = { guibg = gradient[2], guifg = theme['type'] },
    ['GitGutterChange'] = { guibg = gradient[2], guifg = theme['number'] },
    ['GitGutterDelete'] = { guibg = gradient[2], guifg = theme['keyword'] },

    -- telescope
    ['TelescopePromptNormal'] = { guibg = 'none' },
    ['TelescopePromptBorder'] = { guibg = 'none' },
    ['TelescopePromptPrefix'] = { guibg = 'none' },
    ['TelescopePromptTitle']  = { guibg = theme['string'] },
    ['TelescopeBorder']       = { guifg = theme['punctuation'] },

    --
    -- langauge specific
    --
    ["@none.vue"]        = '@variable',
    ["@constructor.lua"] = { guifg = theme['punctuation'] },
    ["@type.typescript"] = { guifg = theme['type'] },
    ["@keyword.force"]   = { guifg = theme['keyword'] },
}

local function setup()
    require('transparent').setup({
        enable = true
    })

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
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                {
                    'branch', icon = ''
                },
                {
                    'diff', diff_color = {
                        added    = 'GitGutterAdd',
                        modified = 'GitGutterChange',
                        removed  = 'GitGutterDelete',
                    }
                }
            },
            lualine_c = { 'filename' },
            lualine_x = {},
            lualine_y = { 'filetype' },
            lualine_z = { 'location' },
        }
    })

    for group, color in pairs(colors) do
        colorscheme.highlight[group] = color
    end
end

return setup()
