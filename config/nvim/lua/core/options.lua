local g = vim.g
local o = vim.opt

-- Add more git filetypes
vim.filetype.add({
	pattern = {
		[".*/git/config"] = "gitconfig",
		[".*/git/ignore"] = "gitignore",
		[".*/git/attributes"] = "gitattributes",
	},
})

-- Enable/disable builtin modules/plugins/providers
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")
require("vim._core.ui2").enable({})

-- UI
o.number = true
o.cmdheight = 0
o.laststatus = 0
o.showtabline = 0
o.cursorline = true
o.termguicolors = true
o.shortmess:append("I")
o.winborder = "rounded"
o.statusline = "%#StatusLine#%=" .. string.rep("~", 1) .. "%="
o.fillchars = { eob = " ", msgsep = "~", stl = "~", stlnc = "~" }

-- Editor
o.mouse = "nv"
o.tabstop = 2
o.textwidth = 80
o.confirm = true
o.timeout = true
o.shiftwidth = 2
o.undofile = true
o.scrolloff = 999
o.swapfile = false
o.timeoutlen = 500
o.autowrite = true
o.expandtab = true
o.smarttab = false
o.hlsearch = false
o.smartcase = true
o.shiftround = true
o.autoindent = true
o.ignorecase = true
o.splitbelow = true
o.splitright = true
o.breakindent = true
o.virtualedit = "block"
o.clipboard = "unnamedplus"
o.formatoptions = "cjlnoqrt"
o.completeopt = { "menu", "menuone", "noselect", "noinsert" }
o.guicursor = "n-o-sm:block,v:block-blinkon500-blinkoff500,r-cr:hor20,i-c-ci-t:ver25"
