-- Tokyonight
require("tokyonight").setup({
	transparent = true,
	styles = {
		floats = "transparent",
		sidebars = "transparent",
		comments = { bold = true },
	},
	on_highlights = function(hl, c)
		hl.MsgArea = {
			bold = true,
		}
		hl.MsgSeparator = {
			bg = c.none,
			fg = c.yellow,
			bold = true,
		}
		hl.StatusLine = {
			bg = c.none,
			fg = c.yellow,
			bold = true,
		}
		hl.StatusLineNC = {
			bg = c.none,
			fg = c.yellow,
			bold = true,
		}
		hl.BlinkCmpGhostText = {
			fg = c.blue,
			bold = true,
		}
		hl.BlinkCmpDocSeparator = {
			fg = c.yellow,
		}
		hl.DiagnosticVirtualTextError = {
			fg = c.error,
			bold = true,
			italic = true,
		}
		hl.DiagnosticVirtualTextWarn = {
			fg = c.warning,
			bold = true,
			italic = true,
		}
		hl.DiagnosticVirtualTextInfo = {
			fg = c.info,
			bold = true,
			italic = true,
		}
		hl.DiagnosticVirtualTextHint = {
			fg = c.hint,
			bold = true,
			italic = true,
		}
		hl.SnippetTabstop = {
			bg = c.bg_highlight,
			fg = c.comment,
			bold = true,
		}
		hl.SnippetTabstopActive = {
			bg = c.bg_highlight,
			fg = c.comment,
			bold = true,
		}
		hl.FzfLuaTitle = {
			fg = c.yellow,
			bold = true,
			italic = true,
		}
		hl.FzfLuaPreviewTitle = {
			fg = c.yellow,
			bold = true,
			italic = true,
		}
	end,
})

vim.cmd([[colorscheme tokyonight]])

-- Devicons
require("nvim-web-devicons").setup()

-- Fidget
require("fidget").setup({
	notification = {
		override_vim_notify = true,
	},
})
