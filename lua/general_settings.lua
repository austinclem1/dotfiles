-- Remap leader to spacebar
vim.g.mapleader = ' '

-- Shorten time for multi key mappings in insert mode
vim.api.nvim_command([[
	autocmd CmdlineEnter,InsertEnter,TermEnter * set timeoutlen=200
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

-- Use bigger font
vim.api.nvim_set_option('guifont', 'Consolas:h14')

-- If file has changed on disk, reload it in vim
vim.api.nvim_set_option('autoread', true)

-- Whitespace characters
vim.api.nvim_set_option('listchars', 'tab:»·,trail:·,nbsp:·')
vim.api.nvim_set_option('list', true)

-- Relative line-numbers
vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('relativenumber', true)
vim.api.nvim_set_option('numberwidth', 5)

-- vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('expandtab', true)

-- Default to split right
vim.api.nvim_set_option('splitright', true)

-- Use smartcase for search
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)

vim.api.nvim_set_option('completeopt', 'menuone,noinsert,noselect')
vim.g.completion_enable_auto_popup = 1
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}

vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
