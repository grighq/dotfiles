local map = vim.keymap.set

-- Snacks
require("snacks").setup({
	input = {
		enabled = true,
	},
	bigfile = {
		enabled = true,
	},
	quickfile = {
		enabled = true,
	},
	explorer = {
		enabled = true,
		trash = true,
		replace_netrw = true,
	},
	picker = {
		enabled = true,
		win = {
			input = {
				keys = {
					["<esc>"] = { "close", mode = { "n", "i" } },
					["<tab>"] = { "list_down", mode = { "i", "n" } },
					["<s-tab>"] = { "list_up", mode = { "i", "n" } },
				},
			},
		},
	},
})

--- Keymaps
map("n", "<leader>sb", function()
	Snacks.picker.buffers()
end, { desc = "Search buffers" })

map("n", "<leader>sf", function()
	Snacks.picker.files()
end, { desc = "Search files" })

map("n", "<leader>sc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search config files" })

map("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })

map({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

map("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })

map("n", "<leader>s;", function()
	Snacks.picker.commands()
end, { desc = "Commands" })

map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File explorer" })

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer" })

map("n", "<leader>ba", function()
	Snacks.bufdelete.all()
end, { desc = "Delete all buffers" })

map("n", "<leader>bi", function()
	Snacks.bufdelete.invisible()
end, { desc = "Delete all invisible buffers" })

map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete all buffers expect current one" })

-- Neogit
require("neogit").setup({})

map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

-- Nvim-surroung
require("nvim-surround").setup()

-- Which-key
require("which-key").setup({
	preset = "helix",
	spec = {
		{ "<leader>s", group = "Search" },
		{ "<leader>d", group = "Buffer" },
	},
	win = {
		title_pos = "center",
	},
	show_help = false,
})
