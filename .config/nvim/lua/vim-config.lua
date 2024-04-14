-- space is the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- for relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- using netrw in tree mode
vim.g.netrw_liststyle = 3

-- tab = 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

-- Show which line the cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- highlight the line the cursor is on
vim.opt.cursorline = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as text is typed
vim.opt.inccommand = 'split'
-- swap files disabled because if you accidentally quit a terminal
-- session without closing the file first, it's a hassle when you
-- try to reopen it
vim.opt.swapfile = false

-- netrw shortcut
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- more intuitive mappings for creating splits
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>sh", vim.cmd.split)

-- moving between splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { desc = 'Move focus to the left split' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { desc = 'Move focus to the right split' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { desc = 'Move focus to the lower split' })
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { desc = 'Move focus to the upper split' })

-- resizing splits
vim.keymap.set("n", "<C-S-j>", "10<C-w>+")
vim.keymap.set("n", "<C-S-k>", "10<C-w>+")
vim.keymap.set("n", "<C-S-h>", "10<C-w>>")
vim.keymap.set("n", "<C-S-l>", "10<C-w><")

-- move the selected text up or down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center the cursor after moving up or down by a half page
-- and also whenever cycling through search results in the buffer
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- J concatenates the line directly below the cursor to the current line
-- this remap allows the cursor to stay in place after this operation
vim.keymap.set("n", "J", "mzJ`z")

-- deletes the highlighted word into the void register so that the currently
-- copied word can be pasted again and again
vim.keymap.set("x", "<leader>p", [["_dP]])

-- deleting to the void register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- copy to system clipboard (+y register)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- exit terminal mode with two escapes instead of pressing control-n twice
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- source the current file
vim.keymap.set('n', '<leader><leader>', '<cmd>so<CR>')

-- open a terminal in a new bottom split
vim.keymap.set('n', '<leader><CR>', '<cmd>split +term<CR>')
