-- TELESCOPE SHORTCUTS
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope lsp_document_symbols<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>sw', ':Telescope lsp_workspace_symbols<CR>', { noremap=true })

-- F11 for fullscreen
vim.api.nvim_set_keymap('', '<F11>', ':FullscreenToggle<CR>', { noremap=true })

-- NERDTREE SETTINGS
-- Open on right
vim.g.NERDTreeWinPos='right'
-- Use Ctrl-N to toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap=true })

-- NEOVIM LSP CONFIG
-- vim.lsp.set_log_level("debug")
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	require('completion').on_attach()
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	-- Mappings
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	-- This is provided by treesitter below, which will fallback to lsp when necessary
	-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end
local servers = { 'zls', 'tsserver', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
	on_attach = on_attach,
}
end

-- TREESITTER CONFIG
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "zig", "typescript", "tsx" },
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition_lsp_fallback = "gd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
}

-- Lightline status bar settings
-- vim.g.lightline = {
-- 	'active': {
-- 		'left': [ [ 'mode', 'paste' ],
-- 			[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
-- 	},
-- 	'component_function': {
-- 		'gitbranch': 'FugitiveHead'
-- 	},
-- }

-- Use vim-surround bindings for vim-sandwich
vim.cmd('runtime macros/sandwich/keymap/surround.vim')
