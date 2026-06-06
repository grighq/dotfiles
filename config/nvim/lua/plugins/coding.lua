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
		["<tab>"] = { "select_next", "snippet_forward", "fallback" },
		["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
	},
})

-- Autopairs
require("nvim-autopairs").setup()
