-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Packer setup
packer.init({
	display = { -- Display in an additional window
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

return packer.startup(function(use)
	------------ CORE ------------ --
	use("wbthomason/packer.nvim") -- Package manager
	use("lewis6991/impatient.nvim") -- Faster loading
	use("nvim-lua/plenary.nvim") -- Additional lua functions
	use("ahmedkhalf/project.nvim") -- Project management
	use("akinsho/toggleterm.nvim") -- Terminal management

	------------ CMP ------------
	use("hrsh7th/nvim-cmp") -- Autocompletion
	use("hrsh7th/cmp-buffer") -- Buffer completion
	use("hrsh7th/cmp-nvim-lsp") -- LSP completion
	use("hrsh7th/cmp-nvim-lua") -- Nvim config completion
	use("hrsh7th/cmp-path") -- Path completion
	use("saadparwaiz1/cmp_luasnip") -- Bridge plugin

	------------ Mason ------------
	use("williamboman/mason.nvim") -- LSP manager
	use("williamboman/mason-lspconfig.nvim") -- Bridge plugin
	use("jay-babu/mason-null-ls.nvim") -- Bridge plugin
	use("jay-babu/mason-nvim-dap.nvim") -- Bridge plugin
	use("RubixDev/mason-update-all") -- Simple command

	------------ LSP ------------
	use("neovim/nvim-lspconfig") -- LSP configuration
	use("b0o/SchemaStore.nvim") -- Json schemas

	------------ Null-Ls ------------
	use("jose-elias-alvarez/null-ls.nvim") -- LSP null-ls (linter, formatter, etc)

	------------ Dap ------------
	use("mfussenegger/nvim-dap") -- Dap
	use("rcarriga/nvim-dap-ui") -- Dap ui
	use("mfussenegger/nvim-dap-python")

	------------ Copilot ------------
	use({
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("user.copilot")
			end, 100)
		end,
	})
	use({ -- Copilot bridge
		"zbirenbaum/copilot-cmp",
	})

	------------ Snippets ------------
	use("L3MON4D3/LuaSnip") -- Snippets engine
	use("rafamadriz/friendly-snippets") -- Snippets collection

	------------ Ui ------------
	use("goolord/alpha-nvim") -- initial screen
	use("lukas-reineke/indent-blankline.nvim") -- Indentation line
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-tree/nvim-web-devicons") -- Icons
	use("norcalli/nvim-colorizer.lua") -- Colorizer

	------------ BufferLine ------------
	use("akinsho/bufferline.nvim") -- Bufferline
	use("SmiteshP/nvim-navic") -- Navigation in Bufferline
	use("ojroques/nvim-bufdel") -- Better removal of buffers

	------------ Themes ------------
	use("ishan9299/nvim-solarized-lua") -- Solarized theme
	use("glacials/vim-kitty") -- Kitty syntax highlighting

	------------ Telescope ------------
	use("nvim-telescope/telescope.nvim") -- Telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	------------ Treesitter ------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-autopairs") -- Autopairs
	use("windwp/nvim-ts-autotag") -- Auto close html tags
	use("p00f/nvim-ts-rainbow") -- Rainbow parentheses
	use("numToStr/Comment.nvim") -- Commenting
	use("JoosepAlviste/nvim-ts-context-commentstring") -- Commenting

	------------ Git ------------
	use("lewis6991/gitsigns.nvim") -- Git signs

	------------ Languages Misc ------------
	-- Markdown without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("rest-nvim/rest.nvim") -- Rest client

	------------ Misc ------------
	use("RRethy/vim-illuminate") -- Highlight word under cursor
	use("folke/which-key.nvim") -- Keybindings
	use("Tastyep/structlog.nvim") -- Structured logging

	use({
		"jackMort/ChatGPT.nvim",
		config = function()
			require("chatgpt").setup({
				-- optional configuration
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
