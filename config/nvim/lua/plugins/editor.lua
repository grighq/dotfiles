-- fff
require("fff").setup({
	prompt = " ",
	layout = {
		show_scrollbar = false,
		prompt_position = "top",
	},
})

vim.keymap.set("n", "sf", function()
	require("fff").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "sc", function()
	require("fff").find_files_in_dir(vim.fn.stdpath("config"))
end, { desc = "Find config nvim" })

vim.keymap.set("n", "sg", function()
	require("fff").live_grep()
end, { desc = "Live grep" })

-- Neogit
require("neogit").setup({})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

-- Which-key
require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>s", group = "Telescope" },
	},
	win = {
		title_pos = "center",
	},
	show_help = false,
})
