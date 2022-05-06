-- Remap leader to spacebar
vim.g.mapleader = ' '

-- Shorten time for multi key mappings in insert mode
vim.api.nvim_command([[
    autocmd CmdlineEnter,InsertEnter,TermEnter * set timeoutlen=400
    autocmd CmdlineLeave,InsertLeave,TermLeave * set timeoutlen=1000
]])

-- Shortcut to exit insert, ex, search, terminal mode
vim.api.nvim_set_keymap('!', 'jk', '<Esc>', { noremap=true })
vim.api.nvim_set_keymap('t', 'jk', '<Esc>', { noremap=true })

-- Shortcut to edit init.lua
vim.api.nvim_set_keymap('', '<Leader>vr', ':tabedit $MYVIMRC<CR>', { noremap=true })

-- Change to current file's directory
vim.api.nvim_set_keymap('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap=true })

-- Shortcut to hide search highlights
vim.api.nvim_set_keymap('n', '<A-/>', ':nohlsearch<CR>', { noremap=true })

-- Shift-Enter inserts new line below in insert mode
vim.api.nvim_set_keymap('i', '<S-CR>', '<C-o>O', { noremap=true })
-- Shift-Space inserts space after cursor in insert mode
vim.api.nvim_set_keymap('i', '<S-Space>', '<Space><Left>', { noremap=true })
-- Remap this so Shift-Enter works on some terminals
vim.api.nvim_set_keymap('i', '\x0a', '<C-o>O', { noremap=true })
vim.api.nvim_set_keymap('i', '<C-CR>', '<C-o>O', { noremap=true })

-- Use bigger font
vim.o.guifont = 'Consolas:h16'

-- Incrementally show effect of commands such as substitute as you type
-- nosplit means don't show a split window with the results, just use
-- the main buffer
vim.o.icm = 'nosplit'

-- If file has changed on disk, reload it in vim
vim.o.autoread = true

-- Whitespace characters
vim.o.listchars = 'tab:»·,trail:·,nbsp:·'
vim.o.list = true

-- Relative line-numbers
vim.o.number = true
-- vim.o.relativenumber = true
vim.o.numberwidth = 5

-- vim.o.tabstop = 2
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Default to split right
vim.o.splitright = true

-- Use smartcase for search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = 'menu,menuone,noselect'
vim.g.completion_enable_auto_popup = 1
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}

-- vim.o.background = 'dark'
-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme codedark')

-- Create file backup for recovery
vim.o.backup = true
-- vim.o.backupdir = vim.fn.stdpath('data') .. '/backup'
-- `backupext` is appended to backup file name
-- Use autocommand to set timestamp before each write
-- vim.api.nvim_exec([[autocmd BufWritePre * :let &backupext=strftime("_%C-%m-%d_%H-%M-%S.bak")]], false)
