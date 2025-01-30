local map = require("util.mapkey").map

local keymap_opts = { noremap = true }
local keymap_silent = { noremap = true, silent = true }

-- map('n', '<C-p>', ":NERDTreeToggle<CR>", keymap_silent)
-- map('n', '<leader>f', ":NERDTreeFocus<CR>", keymap_silent)
map("n", "<C-p>", ":NvimTreeToggle<CR>", keymap_silent)

-- pane navigation
map("n", "<C-h>", "<C-w>h", keymap_silent)
map("n", "<C-j>", "<C-w>j", keymap_silent)
map("n", "<C-k>", "<C-w>k", keymap_silent)
map("n", "<C-l>", "<C-w>l", keymap_silent)

-- pane resizing
map("n", "<C-w>k", ":resize +5<CR>", keymap_silent)
map("n", "<C-w>j", ":resize -5<CR>", keymap_silent)
map("n", "<C-w>h", ":vertical resize +5<CR>", keymap_silent)
map("n", "<C-w>l", ":vertical resize -5<CR>", keymap_silent)

-- indenting
map("v", "<", "<gv", keymap_silent)
map("v", ">", ">gv", keymap_silent)

-- telescope
require("plugins")

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, keymap_silent)
map("n", "<leader>fg", builtin.live_grep, keymap_silent)
map("n", "<leader>fb", builtin.buffers, keymap_silent)
map("n", "<leader>fh", builtin.help_tags, keymap_silent)

-- toggleterm
map("n", "<C-b>", ":ToggleTerm direction=vertical<CR>", keymap_silent)
map("n", "<C-n>", ":ToggleTerm direction=float<CR>", keymap_silent)

map("t", "<esc>", [[<C-\><C-n>]], keymap_silent)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], keymap_silent)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], keymap_silent)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], keymap_silent)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], keymap_silent)
