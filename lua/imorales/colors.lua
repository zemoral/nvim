require('imorales.treesitter')

local theme = {
    ['variable'] = '#EEEEEE', -- white 
    ['function'] = '#87D7FF', -- blue
    ['keyword'] = '#FF5F5F', -- red
    ['string'] = '#FFFFD7', -- yellow
    ['number'] = '#F1BC7E', -- orange
    ['class'] = '#AFAFFF', -- purple
    ['type'] = '#AFFFAF', -- green
    ['bool'] = '#FFAFFF', -- pink
    ['misc'] = '#87AFAF', -- teal
    ['punctuation.dark'] = '#9e9e9e',
    ['background'] = '#2d2d30',
}

local links = {
    ["@include"] = 'Keyword',
    ["@operator"] = 'Keyword',
    ["@punctuation.delimiter"] = { guifg = theme['punctuation.dark'] },
    ['@property'] = '@variable',
    ['@field'] = '@variable',
    ['@parameter'] = '@variable',
    ['@type'] = '@variable',
    ['@type.declaration'] = { guifg = theme['type'] }
}

local function setup()
    require("base16-colorscheme").setup({
        base00 = theme['background'],
        base01 = '#2c313c',
        base02 = '#3e4451',
        base03 = '#6c7891',
        base04 = '#565c64',
        base05 = '#abb2bf',
        base06 = '#9a9bb3',
        base07 = '#c5c8e6',
        base08 = theme['variable'],
        base09 = theme['number'],
        base0A = theme['class'],
        base0B = theme['string'],
        base0C = theme['misc'],
        base0D = theme['function'],
        base0E = theme['keyword'],
        base0F = theme['type'],
    })

    for group, link in pairs(links) do 
        require('base16-colorscheme').highlight[group] = link
    end
end

return setup()
