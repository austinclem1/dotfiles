-- Ensure packer is installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  vim.api.nvim_command 'packadd packer.nvim'
end

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
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
	-- Lightweight status line
	use 'itchyny/lightline.vim'
	use 'justinmk/vim-sneak'
	-- Pair completion
	use 'Raimondi/delimitMate'
	-- Easy text object for working with indentation blocks (i.e. function blocks)
	use 'michaeljsmith/vim-indent-object'
	use 'lambdalisue/vim-fullscreen'
	use 'preservim/nerdtree'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-repeat'
	-- Alternative to vim surround
	use 'machakann/vim-sandwich'
	use 'vim-scripts/ReplaceWithRegister'
	-- Adds some new text targets like 'a' for function arguments
	use 'wellle/targets.vim'
	-- VSCode style theme
	use 'tomasiser/vim-code-dark'
	-- Edits in quickfix menu affect code they reference
	use 'stefandtw/quickfix-reflector.vim'
	use 'ziglang/zig.vim'
end)
