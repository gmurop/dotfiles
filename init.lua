

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.mouse = 'a'
vim.opt.scroll = 5
vim.opt.autoindent = true
vim.opt.autowrite = true

-- netwr options

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0

-- leader key

vim.g.mapleader = ','

-- Keybindings

vim.keymap.set({'i'}, '<leader>c', '<Esc>')

vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^')
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set({'n', 'x'}, 'gy', '"+y')
vim.keymap.set({'n', 'x'}, 'gp', '"+p')

vim.keymap.set({'n', 'x', 'o'}, '<leader>dd', ':Lexplore %:p:h<cr>') -- Open netwr in the dir of current file
vim.keymap.set({'n', 'x', 'o'}, '<leader>da', ':Lexplore<cr>') -- Open netwr in the dir of working directory

-- fzf

vim.keymap.set('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })

-- commands

vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

-- plugins

local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print('Installing lazy.nvim ...')
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/folke/lazy.nvim.git',
			'--branch=stable', -- latest stable release
			path
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end
	
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
	{
		'folke/tokyonight.nvim',
		style = 'night',
		lazy = false,
		priority = 1000,
		opts = {}
	},
	{'kyazdani42/nvim-web-devicons'},
	{'nvim-lualine/lualine.nvim'},
	{ 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-treesitter/nvim-treesitter-textobjects'},
	{
		'numToStr/Comment.nvim',
		lazy = false
	},
	{
		'kylechui/nvim-surround',
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()

		end
	},
	{'lewis6991/gitsigns.nvim'},
	{
		"ibhagwan/fzf-lua",
		config = function() 
			require("fzf-lua").setup({})
		end
	}
})

-- colorscheme

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

vim.opt.showmode = false
require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'tokyonight',
		component_separators = '|',
		section_separators = ''
	}
})

-- blankline
require('ibl').setup({
	enabled = true,
	scope = {
		enabled = true
	}
})

-- treesitter
require('nvim-treesitter.configs').setup({
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		enable = true,
		lookahead = true,
		keymaps = {
			["af"] = "@function.outer"
		}
	},
	indent = {
		enable = true
	}
})

-- require('nvim-treesitter-textobjects').setup()

-- Comment

require('Comment').setup()

-- gitsigns
require('gitsigns').setup()
-- TODO: Experimnt with treesitting folding
