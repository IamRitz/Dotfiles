require("nvim-tree").setup({
    -- Default options
    respect_buf_cwd = true,

    diagnostics = {
        enable = true
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
})

