-- Intall
require("mason").setup()

-- Config LSP
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
			telemetry = { enable = false },
		},
	},
})

vim.diagnostic.config({
	underline = false,
	virtual_text = {
		active = true,
		prefix = " ",
	},
	severity_sort = true,
	update_in_insert = false,
	float = {
		source = true,
		border = "rounded",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.ERROR] = "",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

-- Auto enable intalled LSP servers
require("mason-lspconfig").setup()
-- require("fidget").setup({
-- 	notification = {
-- 		override_vim_notify = true,
-- 	},
-- logger = {
-- 	level = vim.log.levels.WARN, -- Minimum logging level
-- 	max_size = 10000, -- Maximum log file size, in KB
-- 	float_precision = 0.01, -- Limit the number of decimals displayed for floats
-- 	-- Where Fidget writes its logs to
-- 	path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
-- },
-- })

-- Conform
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
		json5 = { "prettier" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		kdl = { "kdlfmt" },
		html = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		["_"] = { "trim_whitespace" },
	},
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

-- Commands enable/disable autoformat-on-save
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
