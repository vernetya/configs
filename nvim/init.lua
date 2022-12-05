if vim.g.vscode then
	-- VSCode config

	-- line numer ----------------------------------------
	vim.opt.relativenumber = true
	vim.opt.number = true

	-- seach options ----------------------------------------
	vim.opt.ignorecase = true -- ignore case in general
	vim.opt.smartcase = true -- ignore uppercase unless search term start up letter
	-- vim.opt.hlsearch = false -- disable highlight of previous search

	-- key bindings --------------------------------------------
	vim.g.mapleader = ' '

	-- do real delete instead of cut
	vim.keymap.set({'n', 'v'}, 'x', '"_x')
	vim.keymap.set({'n', 'v'}, 'c', '"_c')
	vim.keymap.set({'n', 'v'}, 'd', '"_d')

	-- use leader to register into unnamed register
	vim.keymap.set({'n', 'v'}, '<leader>x', '""x')
	vim.keymap.set({'n', 'v'}, '<leader>c', '""c')
	vim.keymap.set({'n', 'v'}, '<leader>d', '""d')

	vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
	-- copy/paste from clipboard
	vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
	vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')

	-- clear search highlight 
	vim.keymap.set('', '<leader>h', ':nohl<CR>', { silent = true } )

	-- auto commands
	local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

	vim.api.nvim_create_autocmd('TextYankPost', {
		group = augroup,
		desc = 'Highlight on yank',
		callback = function(event)
			vim.highlight.on_yank({higroup = 'Visual', timeout = 700})
		end
	})


else
	-- regular nvim config


	-- line numer ----------------------------------------
	vim.opt.relativenumber = true
	vim.opt.number = true

	-- mouse mode always enabled ------------------------------
	vim.opt.mouse = 'a'

	-- seach options ----------------------------------------
	vim.opt.ignorecase = true -- ignore case in general
	vim.opt.smartcase = true -- ignore uppercase unless search term start up letter
	-- vim.opt.hlsearch = false -- disable highlight of previous search

	-- tab config -----------------------------------------
	vim.opt.tabstop = 2 -- tab only 2 spaces wide
	vim.opt.shiftwidth = 2 -- when using << or >>, shift by 2
	vim.opt.expandtab = false -- do not transform tab into spaces


	-- key bindings --------------------------------------------
	vim.g.mapleader = ' '

	-- do real delete instead of cut
	vim.keymap.set({'n', 'v'}, 'x', '"_x')
	vim.keymap.set({'n', 'v'}, 'c', '"_c')
	vim.keymap.set({'n', 'v'}, 'd', '"_d')

	-- use leader to register into unnamed register
	vim.keymap.set({'n', 'v'}, '<leader>x', '""x')
	vim.keymap.set({'n', 'v'}, '<leader>c', '""c')
	vim.keymap.set({'n', 'v'}, '<leader>d', '""d')

	vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
	-- copy/paste from clipboard
	vim.keymap.set({'n', 'x'}, '<leader>p', '"+p')
	vim.keymap.set({'n', 'x'}, '<leader>y', '"+y')

	-- clear search highlight 
	vim.keymap.set('', '<leader>h', ':nohl<CR>', { silent = true } )

	-- plugins packer -------------------------------------------
	local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	local install_plugins = false

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		print('Installing packer...')
		local packer_url = 'https://github.com/wbthomason/packer.nvim'
		vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
		print('Done.')

		vim.cmd('packadd packer.nvim')
		install_plugins = true
	end


	require('packer').startup(function(use)
		-- Package manager
		use 'wbthomason/packer.nvim'

		use { -- LSP Configuration & Plugins
			'neovim/nvim-lspconfig',
			requires = {
				-- Automatically install LSPs to stdpath for neovim
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',

				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
			},
		}

		use { -- Autocompletion
			'hrsh7th/nvim-cmp',
			requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
		}



		-- Theme 
		use 'folke/tokyonight.nvim'
		use 'EdenEast/nightfox.nvim'
		use 'Shatur/neovim-ayu'


		use 'folke/lsp-colors.nvim' -- additional LSP colorscheme

		-- reauire to install one nerd font and select it in the terminal
		use 'nvim-tree/nvim-web-devicons'

		-- # Load lualine
		use { 'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('lualine').setup({
					options = {
						theme = "16color",
					}
				})
			end,
		}

		-- which key to show key bindings
		use {
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		}
		
		-- telescope
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} }
		}

		-- # Load nvim-lspconfig
		use "neovim/nvim-lspconfig"

		if install_plugins then
			require('packer').sync()
		end
	end)

	if install_plugins then
		return
	end

	vim.opt.termguicolors = true

	vim.cmd('colorscheme slate')
	require('lualine').setup()
	require("mason").setup()

	-- auto commands
	local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

	vim.api.nvim_create_autocmd('TextYankPost', {
		group = augroup,
		desc = 'Highlight on yank',
		callback = function(event)
			vim.highlight.on_yank({higroup = 'Visual', timeout = 500})
		end
	})


	-- telescope mapping
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
	vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
	vim.keymap.set('n', '<leader>fc', builtin.command_history, {})


	---
	-- Global Config
	---

	local lspconfig = require('lspconfig')
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities = vim.tbl_deep_extend(
		'force',
		lsp_defaults.capabilities,
		require('cmp_nvim_lsp').default_capabilities()
	)

	---
	-- LSP Servers
	---

	lspconfig.sumneko_lua.setup({
			settings = {
					Lua = {
							diagnostics = {
									globals = { 'vim' }
							}
					}
			}
	})

end
