-- Fzf-lua
require("fzf-lua").setup({
	globals = {
		autoclose = true,
	},
	winopts = {
		preview = {
			scrollbar = false,
		},
	},
	fzf_opts = {
		["--padding"] = "0,0,0,1",
	},
	files = {
		cwd_prompt = false,
		winopts = { title_flags = false },
	},
})

--- Keymaps
vim.keymap.set("n", "<leader>sf", function()
	require("fzf-lua").files()
end, { desc = "Files in cwd" })

vim.keymap.set("n", "<leader>sg", function()
	require("fzf-lua").live_grep()
end, { desc = "Grep in cwd" })

vim.keymap.set("n", "<leader>sc", function()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Files nvim config" })

vim.keymap.set("n", "<leader>sb", function()
	require("fzf-lua").buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>sw", function()
	require("fzf-lua").grep_cword()
end, { desc = "Current word" })

vim.keymap.set("n", "<leader>sr", function()
	require("fzf-lua").resume()
end, { desc = "Resume" })

vim.keymap.set("n", "<leader>sd", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>so", function()
	require("fzf-lua").old_files()
end, { desc = "Old files" })

-- Which-key
require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>s", group = "Find" },
	},
	win = {
		title_pos = "center",
	},
	show_help = false,
})
