-- Intsall/update hooks
local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	-- Build fuzzy matcher for blink.cmp(rust toolchain needed)
	if name == "blink.cmp" and (kind == "install" or kind == "update") then
		vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
	end
	-- Auto update treesitter parsers
	if name == "nvim-treesitter" and kind == "update" then
		if not ev.data.active then
			vim.cmd.packadd("nvim-treesitter")
		end
		vim.cmd("TSUpdate")
	end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

-- Intsall
vim.pack.add({
	-- UI
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	-- LSP, linters, formatters
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	-- Editor
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/folke/which-key.nvim",
	-- Coding
	"https://github.com/saghen/blink.cmp",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/rafamadriz/friendly-snippets",
	-- Treesitter
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

-- Setup
require("plugins.ui")
require("plugins.lsp")
require("plugins.editor")
require("plugins.coding")
require("plugins.treesitter")
