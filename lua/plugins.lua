-- Ensure packer is installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- Coc lsp while native is worked on
	-- use { 'neoclide/coc.nvim', branch = 'release' }
	-- Native neovim lsp support
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/completion-nvim'
	-- Treesitter for syntax highlighting and more
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/nvim-treesitter-refactor'
	-- use 'nvim-treesitter/completion-treesitter'
	-- Fuzzy finding
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	-- Status line
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup{
				options = {
					theme = 'gruvbox',
					section_separators = '',
					component_separators = '',
				},
				sections = {
					lualine_a = { {'mode', upper = true} },
					lualine_b = { {'branch', icon = ''} },
					lualine_c = { {'filename', file_status = true} },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location'  },
				},
				inactive_sections = {
					lualine_a = {  },
					lualine_b = {  },
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {  },
					lualine_z = {   }
				}
			}
		end
	}
	use 'justinmk/vim-sneak'
	-- Pair completion
	use 'Raimondi/delimitMate'
	-- Easy text object for working with indentation blocks (i.e. function blocks)
	use 'michaeljsmith/vim-indent-object'
	-- Easy fullscreen support
	use 'lambdalisue/vim-fullscreen'
	-- Nerdtree file navigation
	use 'preservim/nerdtree'
	-- Git support
	use 'tpope/vim-fugitive'
	-- Comment action
	use 'tpope/vim-commentary'
	-- Unix like ex commands i.e. Mkdir
	use 'tpope/vim-eunuch'
	-- Better '.' repeat support with various plugins
	use 'tpope/vim-repeat'
	-- Mappings for easy list navigation etc.
	use 'tpope/vim-unimpaired'
	-- Alternative to vim surround
	use 'machakann/vim-sandwich'
	-- 'gr' mapping to replace object with active register
	use 'vim-scripts/ReplaceWithRegister'
	-- Adds some new text targets like 'a' for function arguments
	use 'wellle/targets.vim'
	-- Swap function arguments around and other delimited items
	use 'machakann/vim-swap'
	-- Themes
	use 'tomasiser/vim-code-dark'
	use {'npxbr/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
	-- Edits in quickfix menu affect code they reference
	use 'stefandtw/quickfix-reflector.vim'
	use 'ziglang/zig.vim'
	use 'habamax/vim-godot'
        use 'dart-lang/dart-vim-plugin'
end)
