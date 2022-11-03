local colorscheme = require("imorales.colorscheme")
local hi = colorscheme.highlight

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
}


colorscheme.setup({
    base00 = '#16161D',
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

local override = {
    Boolean = { guifg = theme['bool'] }
}

local linked = {
    Keyword = {
        'Repeat',
        'Statement',
        'Operator',
    },
    Function = {
        'Identifier',
        'Macro',
        'Method',
    },
}

for group, color in pairs(override) do
    hi[group] = color
end

for defined, group in pairs(linked) do 
    for _, link in pairs(group) do
        hi[link] = defined
    end
end