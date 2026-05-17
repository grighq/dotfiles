-- Blink.cmp
require("blink.cmp").setup({
	cmdline = {
		completion = {
			list = { selection = { preselect = false } },
			menu = { auto_show = true },
		},
	},
	completion = {
		list = { selection = { preselect = false } },
		menu = { scrollbar = false },
		ghost_text = { enabled = true },
		documentation = { auto_show = true },
	},
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<cr>"] = {
			function(cmp)
				if cmp.is_menu_visible() then
					if cmp.get_selected_item() == nil then
						cmp.hide()
						return true
					else
						cmp.select_and_accept()
						return true
					end
				end
			end,
			"fallback",
		},
		-- ["<tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<tab>"] = {
			"select_next",
			"snippet_forward",
			function()
				local line = vim.api.nvim_get_current_line()
				local col = vim.api.nvim_win_get_cursor(0)[2]
				local next_char = line:sub(col + 1, col + 1)
				if next_char:match("[%)}%],]") then
					vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col + 1 })
					return true
				end
			end,
			"fallback",
		},
		["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
})

-- Autopairs
require("nvim-autopairs").setup()
