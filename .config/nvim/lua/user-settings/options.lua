local set = vim.opt

vim.g.Hexokinase_highlighters = { 'backgroundfull' }

-- All possible highlighters
-- {   'virtual',
--    'sign_column',
--    'background',
--    'backgroundfull',
--    'foreground',
--    'foregroundfull'
--  }


-- Nvim tree option
-- vim.g.nvim_tree_respect_buf_cwd = 1 --now moved to setup

-- Vimtex setting --
vim.g.vimtex_view_method = 'zathura'

vim.o.background = "dark"
vim.notify = require("notify")

set.expandtab = true
set.smartindent = true
set.smarttab = true
set.softtabstop = 4
set.shiftwidth = 4
set.tabstop = 4
set.autoindent = true
set.cindent = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true
set.showmode = false
set.clipboard = "unnamedplus"

set.number = true
set.relativenumber = true
set.cursorline = true

set.hidden = true

-- vim.cmd("colorscheme nightfox")
-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme dracula]])
vim.cmd [[set iskeyword+=-]]

-- To Change working directory as we access it's files
vim.cmd [[autocmd BufEnter * silent! lcd %:p:h]]
