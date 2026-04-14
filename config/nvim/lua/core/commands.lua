local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
local function augroup(name)
	return vim.api.nvim_create_augroup("griga_" .. name, { clear = true })
end

-- Disable new comment line with o, O
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

-- Close command history with "q"
autocmd("CmdwinEnter", {
	group = augroup("close_with_q"),
	pattern = "*",
	callback = function(event)
		vim.schedule(function()
			vim.keymap.set("n", "q", "<cmd>quit<CR>", {
				buffer = event.buf,
				silent = true,
				desc = "Quit command window",
			})
		end)
	end,
})

-- Open help and man in vsplit
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
