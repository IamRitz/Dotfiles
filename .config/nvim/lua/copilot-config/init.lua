
-- use this table to disable/enable filetypes
--vim.g.copilot_filetypes = { xml = false, }
vim.g.copilot_filetypes = { ["*"] = false, c = false, cpp = false, python = true}

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
