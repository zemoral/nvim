local window = {
    modal = {
        win     = -1,
        buf     = -1,
        config  = {},
        display = {},
        default = {
            scale  = 0.8,
            enter  = true,
            listed = false,
        },
    },
}

function window.width(opts)
    return opts.width or math.floor(vim.o.columns * (opts.scale or 1))
end

function window.height(opts)
    return opts.height or math.floor(vim.o.lines * (opts.scale or 1))
end

function window.config(opts)
    local width = window.width(opts)
    local height = window.height(opts)
    return {
        width  = width,
        height = height,
        cursor = {
            col = math.floor((vim.o.columns - width) / 2),
            row = math.floor((vim.o.lines - height) / 2),
        }
    }
end

function window.floating(opts)
    local modal = vim.tbl_extend("force", window.modal.default, opts or {})
    window.modal.config = window.config(modal)
    window.modal.display = {
        relative = 'editor',
        style    = 'minimal',
        border   = 'rounded',
        width    = window.modal.config.width,
        height   = window.modal.config.height,
        col      = window.modal.config.cursor.col,
        row      = window.modal.config.cursor.row,
    }
    if opts.buf then
        window.model.buf = opts.buf
    else
        window.modal.buf = vim.api.nvim_create_buf(opts.listed or false, true)
    end
    if opts.win then
        window.modal.win = opts.win
    else
        window.model.win = vim.api.nvim_open_win(window.modal.buf, modal.enter, window.modal.display)
    end
    return window.modal
end

window.floating()
