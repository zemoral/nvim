local M = {}

M.window = {
    modal   = {
        win    = -1,
        buf    = -1,
        state  = {},
        config = {},
    },
    default = {
        scale  = 0.8,
        enter  = true,
        listed = true,
    }
}

local function get_width(opts)
    return opts.width or math.floor(vim.o.columns * (opts.scale or 1))
end

local function get_height(opts)
    return opts.height or math.floor(vim.o.lines * (opts.scale or 1))
end

function M.from(opts)
    local modal = vim.tbl_extend("force", M.window.default, opts or {})
    local width = get_width(modal)
    local height = get_height(modal)
    M.window.modal.state = {
        width  = width,
        height = height,
        cursor = {
            col = math.floor((vim.o.columns - width) / 2),
            row = math.floor((vim.o.lines - height) / 2),
        },
        opts   = {
            scale  = modal.scale,
            enter  = modal.enter,
            lines  = modal.lines,
            listed = modal.listed,
        },
    }
    return M.window.modal.state
end

function M.sync(state)
    M.window.modal.config = {
        relative = 'editor',
        style    = 'minimal',
        border   = 'rounded',
        width    = state.width,
        height   = state.height,
        col      = state.cursor.col,
        row      = state.cursor.row,
    }
    if state.opts.buf and vim.api.nvim_buf_is_valid(state.opts.buf) then
        -- prefer user buffer iff valid
        M.window.modal.buf = state.opts.buf
    else
        -- o.w. create a new scratch buffer
        local scratch = true
        vim.schedule(function()
            M.window.modal.buf = vim.api.nvim_create_buf(state.opts.listed, scratch)
        end)
    end
    if state.opts.lines then
        -- write user supplied text
        vim.schedule(function()
            vim.api.nvim_buf_set_lines(M.window.modal.buf, 0, -1, false, state.opts.lines)
        end)
    end
    if state.opts.win and vim.api.nvim_win_is_valid(state.opts.win) then
        -- prefer user window iff valid
        M.window.modal.win = state.opts.win
        vim.schedule(function()
            vim.api.nvim_set_current_win(M.window.modal.win)
        end)
    else
        -- o.w. open a new floating window
        vim.schedule(function()
            M.window.modal.win = vim.api.nvim_open_win(
                M.window.modal.buf, state.opts.enter, M.window.modal.config
            )
        end)
    end
    return M.window.modal
end

function M.open(opts)
    local state = M.from(opts)
    local modal = M.sync(state)
    return modal
end

return M
