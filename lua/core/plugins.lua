local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{
		"MunifTanjim/prettier.nvim",
		dependencies = { "neovim/nvim-lspconfig", "jose-elias-alvarez/null-ls.nvim", "MunifTanjim/prettier.nvim" },
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"hrsh7th/cmp-buffer",
	},

	{
		"hrsh7th/cmp-path",
	},

	{
		"hrsh7th/cmp-cmdline",
	},

	{
		"hrsh7th/nvim-cmp",
	},

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},

	{
		"windwp/nvim-autopairs",
	},

	{
		"windwp/nvim-ts-autotag",
	},

	{
		"terrortylor/nvim-comment",
	},
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	{
		"lewis6991/gitsigns.nvim",
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"norcalli/nvim-colorizer.lua",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"anuvyklack/fold-preview.nvim",
		dependencies = "anuvyklack/keymap-amend.nvim",
	},
	{
		"robert-oleynik/clangd-nvim",
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
	},
	{
		"dcampos/nvim-snippy",
	},
	{
		"anuvyklack/pretty-fold.nvim",
		dependencies = { "anuvyklack/fold-preview.nvim" },
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
	},
	-- {
	-- 	"hrsh7th/nvim-compe",
	-- 	branch = "release",
	-- },
})
