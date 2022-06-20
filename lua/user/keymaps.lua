local opts = { noremap = true, silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "gw", "<C-w>", opts)

-- Old file explorer (now using nvim-tree.lua)
-- keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode when shifting tab layer
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-1<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Telescope --
keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>g', '<cmd>Telescope live_grep<CR>', opts)

-- Bufferline --
keymap('n', '<C-x>', '<cmd>Bdelete<CR>', opts)

-- ToggleTerm --
keymap('n', '|', '<cmd>ToggleTerm direction=float<CR>', opts)
keymap('n', '~', '<cmd>ToggleTerm direction=horizontal<CR>', opts)
keymap('n', '<a-|>', '<cmd>ToggleTerm direction=tab<CR>', opts)
