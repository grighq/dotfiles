local autocmd = vim.api.nvim_create_autocmd
-- local usercmd = vim.api.nvim_create_user_command
local function augroup(name)
	return vim.api.nvim_create_augroup("griga_" .. name, { clear = true })
end

-- Disable new comment line with <o>, <O>
autocmd("BufWinEnter", {
	group = augroup("disable_new_comment_line"),
	callback = function()
		vim.cmd([[setlocal formatoptions-=o]])
	end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"qf",
		"help",
		"dbout",
		"config",
		"notify",
		"lspinfo",
		"nvim-pack",
		"checkhealth",
		"nvim-undotree",
		-- 'lazygit',
		-- 'grug-far',
		-- 'startuptime',
		-- 'gitsigns-blame',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

-- Close cmd history with <q> and disable line numbers
autocmd("CmdwinEnter", {
	group = augroup("comfortable_cmdwin"),
	pattern = "*",
	callback = function(event)
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.schedule(function()
			vim.keymap.set("n", "q", "<cmd>quit<CR>", {
				buffer = event.buf,
				silent = true,
				desc = "Quit command window",
			})
		end)
	end,
})

-- Open help/man in vsplit
autocmd("FileType", {
	group = augroup("open_help_in_vsplit"),
	pattern = { "help", "man" },
	callback = function()
		vim.cmd.wincmd("L")
	end,
})

-- Highlight on yank
autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Config for go filetypes
autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = false
		-- Delete keymaps because treesitter-textobjects conflict
		pcall(vim.keymap.del, "n", "]]", { buffer = true })
		pcall(vim.keymap.del, "n", "[[", { buffer = true })
	end,
})

-- Disable line numbers for some filetypes
-- autocmd("FileType", {
-- 	group = augroup("disable_numbers"),
-- 	pattern = { "nvim-undotree", "diff" },
-- 	callback = function()
-- 		vim.opt_local.number = false
-- 		vim.opt_local.relativenumber = false
-- 	end,
-- })
