package.path = package.path .. ';/home/gmurop/.config/nvim/gmurop/?.lua'
local keys = require 'keys'

vim.loader.enable()

vim.opt.number = true
vim.opt.relativenumber = true
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
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.background = 'dark'

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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, config = function() 
		require('catppuccin').setup()
		vim.cmd.colorscheme('catppuccin')
	end },
	{ 'nvim-lualine/lualine.nvim',
	  config = function() require('lualine').setup() end
	},
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'nvim-treesitter/nvim-treesitter-textobjects' },
	{ 'numToStr/Comment.nvim', lazy = false },
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup()
		end
	},
	{ 'lewis6991/gitsigns.nvim' },
	{
		'ibhagwan/fzf-lua',
		config = function()
			require('fzf-lua').setup {
				winopts = {
					split = 'belowright new',
					fullscreen = true,
					layout = 'horizontal'

				}
			}
		end
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, config = function() 
		local highlight = {
			"CursorColumn",
			"Whitespace"
		}
		require('ibl').setup({
			indent = {
				char = '|'
			},
			scope = {
				enabled = true,
				show_start = false,
				char = ''
			}
	}) end },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp', config = function()
			-- lsp
			local cmp = require('cmp')
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-e>'] = cmp.mapping.abort(),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'buffer' }
				})
			})

			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
					{ name = 'cmdline' },
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require'lspconfig'.tsserver.setup{
				capabilities = capabilities
			}
		end 
	 }
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev) 
		keys.set_lsp_keybindings(ev)
	end})

-- treesitter
require('nvim-treesitter.configs').setup({
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			lookahead = true,
			enable = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['as'] = { query = '@scope.inner', query_group = 'locals' }
			}
		}
	},
	indent = {
		enable = true
	}
})

-- Comment
require('Comment').setup()

-- gitsigns
require('gitsigns').setup()


