-- TELESCOPE SHORTCUTS
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { noremap=true })
vim.keymap.set('n', '<leader>sd', telescope_builtin.lsp_document_symbols, { noremap=true })
vim.keymap.set('n', '<leader>sw', telescope_builtin.lsp_workspace_symbols, { noremap=true })
vim.keymap.set('n', '<leader>sr', telescope_builtin.lsp_references, { noremap=true })
vim.keymap.set('n', '<leader>st', telescope_builtin.treesitter, { noremap=true })
vim.keymap.set('n', '<leader>ch', telescope_builtin.command_history, { noremap=true })

vim.keymap.set('n', '<leader>fr', telescope_builtin.oldfiles, { noremap=true })
vim.keymap.set('n', '<leader>ff', telescope_builtin.git_files, { noremap=true })
vim.keymap.set('n', '<leader>fq', telescope_builtin.quickfix, { noremap=true })
vim.keymap.set('n', '<leader>rg', telescope_builtin.live_grep, { noremap=true })
vim.keymap.set('n', '<leader>:', telescope_builtin.command_history, { noremap=true })
vim.keymap.set('n', '<leader>/', telescope_builtin.current_buffer_fuzzy_find, { noremap=true })
vim.keymap.set('n', '<leader>bb', telescope_builtin.buffers, { noremap=true })

-- Telescope Settings
telescope.setup {
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

-- Fuzzy Finder Shortcuts
-- vim.keymap.set('n', '<leader>ff', '<cmd>Files<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>fg', '<cmd>GFiles<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>fr', '<cmd>History<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>rg', '<cmd>Rg<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>:', '<cmd>History:<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>/', '<cmd>BLines<CR>', { noremap=true })
-- vim.keymap.set('n', '<leader>bb', '<cmd>Buffers<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>sd', ':Telescope lsp_document_symbols<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>sw', ':Telescope lsp_workspace_symbols<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>st', ':Telescope treesitter<CR>', { noremap=true })
-- vim.api.nvim_set_keymap('n', '<leader>ch', ':Telescope command_history<CR>', { noremap=true })

-- F11 for fullscreen
vim.keymap.set('', '<F11>', '<cmd>FullscreenToggle<CR>', { noremap=true })

-- NERDTREE SETTINGS
-- Open on right
vim.g.NERDTreeWinPos='right'
-- Use Ctrl-N to toggle
vim.keymap.set('n', '<C-n>', '<cmd>NERDTreeToggle<CR>', { noremap=true })


-- NEOVIM LSP CONFIG
local on_attach = function(client, bufnr)
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- require('completion').on_attach()

    -- Mappings
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- This is provided by treesitter below, which will fallback to lsp when necessary
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local servers = { 'csharp_ls', 'clangd', 'emmet_ls', 'elmls', 'fsautocomplete', 'hls', 'kotlin_language_server', 'sumneko_lua', 'zls', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    debounce_text_changes = 150,
  }
end

-- TREESITTER CONFIG
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "zig", "tsx" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
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
  textobjects = {
    select = {
      enable = true,
      -- lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
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
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = Insert }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'treesitter' },
        { name = 'buffer' },
    })
})
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- Snippet expansion
-- actual expansion key mapping is covered by `cmp.mapping.confirm` above
vim.keymap.set('i', '<C-l>', (vim.fn['vsnip#jumpable'](1) and '<Plug>(vsnip-jump-next)' or '<C-l>'), {})
vim.keymap.set('s', '<C-l>', (vim.fn['vsnip#jumpable'](1) and '<Plug>(vsnip-jump-next)' or '<C-l>'), {})
vim.keymap.set('i', '<C-h>', (vim.fn['vsnip#jumpable'](-1) and '<Plug>(vsnip-jump-prev)' or '<C-h>'), {})
vim.keymap.set('s', '<C-h>', (vim.fn['vsnip#jumpable'](-1) and '<Plug>(vsnip-jump-prev)' or '<C-h>'), {})

vim.g.vsnip_filetypes = {javascript={'javascriptreact', 'html'}}

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
vim.keymap.set('n', '<leader>fo', '<cmd>Format<CR>', { noremap=true, silent=true })

