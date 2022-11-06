require('imorales.treesitter')
require('transparent').setup({
    enable = true
})

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
    ['type']        = '#92d490', -- green
    ['bool']        = '#FFAFFF', -- pink
    ['misc']        = '#87AFAF', -- teal
    ['punctuation'] = gradient[6],
}

local colors = {
    ["@include"]  = '@keyword',
    ["@operator"] = '@keyword',

    ['@field']     = '@variable',
    ['@property']  = '@variable',
    ['@parameter'] = '@variable',

    ["@punctuation.delimiter"] = { guifg = theme['punctuation'] },

    ['@type']                = { guifg = theme['type'] },
    ['@type.builtin']        = { guifg = theme['class'], gui = 'none' },
    ['@type.go']             = '@variable',
    ['@type.declaration.go'] = { guifg = theme['type'] },

    ['@boolean']             = { guifg = theme['bool'] },
    ['@constant.builtin.go'] = { guifg = theme['bool'] },
}

local function setup()
    require("base16-colorscheme").setup({
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

    for group, link in pairs(colors) do
        require('base16-colorscheme').highlight[group] = link
    end
end

return setup()
