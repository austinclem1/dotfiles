-- TELESCOPE SHORTCUTS
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

vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<CR>', { noremap=true })

-- Fuzzy Finder Shortcuts
vim.api.nvim_set_keymap('n', '<leader>ff', ':Files<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':GFiles<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>fr', ':History<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>rg', ':Rg<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>:', ':History:<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>/', ':BLines<CR>', { noremap=true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':Buffers<CR>', { noremap=true })
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
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>dl', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>qq', '<cmd>lua vim.lsp.buf.code_action({only="quickfix"})<CR>', opts)
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
local servers = { 'csharp_ls', 'clangd', 'emmet_ls', 'elmls', 'fsautocomplete', 'hls', 'kotlin_language_server', 'zls', 'tsserver' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
    capabilities = capabilities,
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
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-l>'] = cmp.mapping.confirm({ select = false }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'buffer' },
    })
})

-- Snippet expansion
-- actual expansion key mapping is covered by `cmp.mapping.confirm` above
vim.api.nvim_set_keymap('i', '<C-l>', (vim.fn['vsnip#jumpable'](1) and '<Plug>(vsnip-jump-next)' or '<C-l>'), {})
vim.api.nvim_set_keymap('s', '<C-l>', (vim.fn['vsnip#jumpable'](1) and '<Plug>(vsnip-jump-next)' or '<C-l>'), {})
vim.api.nvim_set_keymap('i', '<C-h>', (vim.fn['vsnip#jumpable'](-1) and '<Plug>(vsnip-jump-prev)' or '<C-h>'), {})
vim.api.nvim_set_keymap('s', '<C-h>', (vim.fn['vsnip#jumpable'](-1) and '<Plug>(vsnip-jump-prev)' or '<C-h>'), {})

-- Debug Adapter
-- local dap = require 'dap'
-- dap.adapters.cpptools = {
--     type = 'executable',
--     command = 'C:/Users/Austin/cpptools-win32/extension/debugAdapters/bin/OpenDebugAD7.exe'
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch",
--         type = "cpptools",
--         request = "launch",
--         program = function()
--             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp

-- -- For dapui
-- require("dapui").setup()

-- Workaround for OrangeT/vim-csharp to detect .razor files
vim.api.nvim_command(
'au BufNewFile,BufRead *.razor compiler msbuild | set filetype=cshtml.html syntax=cshtml'
)

-- Formatter
require('formatter').setup({
    filetype = {
        javascriptreact = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                    stdin = true
                }
            end
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                    stdin = true
                }
            end
        },
        html = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                    stdin = true
                }
            end
        },
    }
})
vim.api.nvim_set_keymap('n', '<leader>fo', ':Format<CR>', { noremap=true, silent=true })

