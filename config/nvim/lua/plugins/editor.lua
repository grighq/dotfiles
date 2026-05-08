-- Telescope
require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
		},
		prompt_prefix = " ",
		selection_caret = " ",
		mappings = {
			i = {
				-- ["<esc>"] = require("telescope.actions").close,
				["<tab>"] = require("telescope.actions").move_selection_next,
				["<s-tab>"] = require("telescope.actions").move_selection_previous,
				["<c-space>"] = require("telescope.actions").toggle_selection,
			},
		},
	},
})

vim.keymap.set("n", "<leader>sc", function()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope neovim config" })

vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>st", require("telescope.builtin").builtin, { desc = "Telescope all pickers" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "Telescope diagnostics" })

require("telescope").load_extension("fzf")

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
