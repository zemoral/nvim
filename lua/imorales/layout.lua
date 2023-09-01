local Box = {
    height    = 0,
    width     = 0,
    direction = '',
}

function Box:new(tbl)
    return setmetatable(tbl or {}, { __index = Box })
end

function Box:vsplit(width, units)
    if units == "%" then
        width = (width / 100) * self.width
    end
    return Box:new({
        height = self.height,
        width = math.floor(width),
        direction = 'v',
    })
end

function Box:hsplit(height, units)
    if units == "%" then
        height = (height / 100) * self.height
    end
    return Box:new({
        height = math.floor(height),
        width = self.width,
        direction = 'h',
    })
end

function Box:nvim_win()
    -- win set upstream
    if self.direction == 'h' then
        vim.cmd(":split")
    end
    if self.direction == 'v' then
        vim.cmd(":vsplit")
    end
    vim.api.nvim_win_set_height(0, self.height)
    vim.api.nvim_win_set_width(0, self.width)
    return vim.api.nvim_get_current_win()
end

local Component = {

}

function Component:new(el, ext)
    return setmetatable(
        { el = el, ext = ext or {} },
        { __index = Component }
    )
end

function Component:render(win)
    vim.api.nvim_set_current_win(win)
    self.win = self.el:nvim_win()
    self.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(self.win, self.buf)
    for _, extension in pairs(self.ext) do
        -- extensions are relative to el
        vim.api.nvim_set_current_win(self.win)
        local container = extension.el
        local render = extension.render
        render(container:nvim_win())
    end
end

local function gutter(target)
    local el = target:vsplit(10, '%')
    return Component:new(el, {
        {
            el     = el:hsplit(70, "%"),
            name   = 'nvim-tree',
            render = function(win)
                vim.api.nvim_set_current_win(win)
                local api = require("nvim-tree.api")
                api.tree.open({ current_window = true })
            end
        },
    })
end

local Layout = { 
    view = {}, 
    config = {},
}

function Layout:new()
    local win = vim.api.nvim_get_current_win()
    local defaults = {
        win = win,
        el = Box:new({
            height = vim.api.nvim_win_get_height(win),
            width  = vim.api.nvim_win_get_width(win),
        })
    }
    return setmetatable(
        defaults,
        { __index = Layout }
    )
end

function Layout:setup(win, components)
end

local layout = Layout:new()
layout:setup()
layout:mount(1000)
