-- TELESCOPE SHORTCUTS
vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope oldfiles<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').git_files({cwd=vim.fn.expand(\'%:p:h\')})<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>gg', ':Telescope live_grep<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require(\'telescope.builtin\').current_buffer_fuzzy_find({sorter = require\'telescope.sorters\'.fuzzy_with_index_bias})<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Telescope buffers<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope lsp_document_symbols<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>sw', ':Telescope lsp_workspace_symbols<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>st', ':Telescope treesitter<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>ch', ':Telescope command_history<CR>', { noremap=true })
-- Telescope Settings
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--follow'
        }
    }
}

vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', { noremap=true })

-- Fuzzy Finder Shortcuts
-- vim.api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fg', ':GFiles<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fr', ':History<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>rg', ':Rg<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>bb', ':Buffers', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope lsp_document_symbols<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>sw', ':Telescope lsp_workspace_symbols<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>st', ':Telescope treesitter<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>ch', ':Telescope command_history<CR>', { noremap=true })

-- delimMate settings
-- Expand carriage return and space when inside matching pair
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_expand_space = 1

-- F11 for fullscreen
vim.api.nvim_set_keymap('', '<F11>', ':FullscreenToggle<CR>', { noremap=true })

-- NERDTREE SETTINGS
-- Open on right
vim.g.NERDTreeWinPos='right'
-- Use Ctrl-N to toggle
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap=true })

-- CoC lsp config
-- vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap=true, silent=false })


-- NEOVIM LSP CONFIG
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- require('completion').on_attach()

	-- Mappings
	local opts = { noremap=true, silent=true }
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	-- This is provided by treesitter below, which will fallback to lsp when necessary
	-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end
local servers = { 'clangd', 'dartls', 'zls', 'tsserver', 'gdscript' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
	on_attach = on_attach,
}
end

-- TREESITTER CONFIG
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "<leader>rr",
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

-- Use vim-surround bindings for vim-sandwich
vim.cmd('runtime macros/sandwich/keymap/surround.vim')

-- Autocompletion
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
    luasnip = true;
  };
}

-- Debug Adapter
local dap = require 'dap'
dap.adapters.cpptools = {
    type = 'executable',
    command = 'C:/Users/Austin/cpptools-win32/extension/debugAdapters/bin/OpenDebugAD7.exe'
}
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cpptools",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp

-- For dapui
require("dapui").setup()
