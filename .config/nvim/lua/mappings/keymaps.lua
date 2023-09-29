local opts = { noremap=true, silent=true }

local term_opts = { silent=true }

local api = vim.api

-- shorten the function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as my leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n"
-- insert_mode = "i"
-- visual_mode = "v"
-- visual_block_mode = "x"
-- term_mode = "t"
-- command_mode = "c"

-- Normal Mode Mappings --
-- Better Window Navigation
keymap("n", "<C-p>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Map ,* to count the occurance of the word under the cursor
keymap("n", ",*", "*<C-O>:%s///gn<CR>", opts)

-- Navigate Bufers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Move visual text up and down for normal mode
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("n", "<A-j>", ":m .+1<CR>==", opts)

-- Personal 
keymap("n", "<Leader>rn", ":.!shuf -i 1-50 -n10<CR>", opts)

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "ii", "<ESC>", opts)

-- Maps Ctrl-BS(or Ctrl-H which vim actually sends) to delete word by word
keymap("i", "<C-h>", "<C-\\><C-o>dB", opts)

-- Move text up and down for insert mode
keymap("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
keymap("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move visual text up and down
-- gv reselects the last visual block and = reindents it
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts) -- doesn't change the previous yanked word

-- Mapping Ctrl-C and Ctrl-v to copy and paste

keymap("v", "<C-c>", '"+yi', term_opts)
keymap("v", "<C-x>", '"+c', term_opts)
keymap("v", "<C-v>", 'c<ESC>"+p', term_opts) 

keymap("i", "<C-v>", '<C-r><C-o>+', term_opts) 

-- vmap <C-c> "+yi
-- vmap <C-x> "+c
-- vmap <C-v> c<ESC>"+p
-- imap <C-v> <C-r><C-o>+


--Visual Block mode
-- Move visual block text up and down
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)

--Telescope mappings
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>' , opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>' , opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>' , opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>' , opts)

-- Reset hlsearch
keymap('n', '<CR>', ':noh<CR>', opts)

--
-- barbar mappings
-- Goto buffer in position...
keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
keymap('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Close buffer
keymap('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
-- keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

-- Sort automatically by...
keymap('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
keymap('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Nvim Tree mappings
keymap('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>', opts)
keymap('n', '<Space>o', '<Cmd>NvimTreeFocus<CR>', opts)

-- Vim api commands
-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})
