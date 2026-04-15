local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.localmapleader = " "

--- Smart selection with builtin incremental selection(treesitter or lsp)
local function smart_select(direction)
	if vim.fn.getcmdwintype() ~= "" or vim.bo.buftype ~= "" then
		local key = direction == "parent" and "<CR>" or "<BS>"
		local feed = vim.api.nvim_replace_termcodes(key, true, false, true)
		vim.api.nvim_feedkeys(feed, "n", false)
		return
	end

	local count = vim.v.count1

	vim.schedule(function()
		local has_ts = vim.treesitter.get_parser(nil, nil, { error = false })

		if direction == "parent" then
			if has_ts then
				require("vim.treesitter._select").select_parent(count)
			else
				vim.lsp.buf.selection_range(count)
			end
		else
			if has_ts then
				require("vim.treesitter._select").select_child(count)
			else
				vim.lsp.buf.selection_range(-count)
			end
		end
	end)
end

map({ "n", "x", "o" }, "<cr>", function()
	smart_select("parent")
end, { desc = "Incremental parent selection" })
map({ "n", "x", "o" }, "<bs>", function()
	smart_select("child")
end, { desc = "Incremental child selection" })

-- Vi style for commandline with <ctrl> prefix
map("c", "<c-h>", "<left>")
map("c", "<c-l>", "<right>")
map("c", "<c-b>", "<s-left>")

-- Usefull motion in insert mode
map("i", "<c-h>", "<left>", { silent = true })
map("i", "<c-l>", "<right>", { silent = true })

-- Navigation
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-p>", "<c-w>p")

-- Save
map({ "i", "x", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>")

-- Terminal mode navigation
map("t", "<esc>", "<c-\\><c-n>")
map("t", "<c-h>", "<c-\\><c-n><c-w>h")
map("t", "<c-j>", "<c-\\><c-n><c-w>j")
map("t", "<c-k>", "<c-\\><c-n><c-w>k")
map("t", "<c-l>", "<c-\\><c-n><c-w>l")

-- Delete buffer
map("n", "<leader>bd", "<cmd>:bd<cr>")

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>")
