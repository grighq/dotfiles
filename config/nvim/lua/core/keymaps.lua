local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.localmapleader = ' '

--- Builtin incremental selection with treesitter/lsp
map({ 'n', 'x', 'o' }, '<cr>', function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require('vim.treesitter._select').select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

map({ 'n', 'x', 'o' }, '<bs>', function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require('vim.treesitter._select').select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = 'Select child treesitter node or inner incremental lsp selections' })

-- Vi style for commandline with <ctrl> prefix
map('c', '<c-h>', '<left>')
map('c', '<c-l>', '<right>')
map('c', '<c-b>', '<s-left>')

-- Usefull motion in insert mode
map('i', '<c-h>', '<left>', { silent = true })
map('i', '<c-l>', '<right>', { silent = true })

-- Navigation
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('n', '<c-p>', '<c-w>p')

-- Save
map({ 'i', 'x', 'n', 's' }, '<c-s>', '<cmd>w<cr><esc>')

-- Terminal mode navigation
map('t', '<esc>', '<c-\\><c-n>')
map('t', '<c-h>', '<c-\\><c-n><c-w>h')
map('t', '<c-j>', '<c-\\><c-n><c-w>j')
map('t', '<c-k>', '<c-\\><c-n><c-w>k')
map('t', '<c-l>', '<c-\\><c-n><c-w>l')

-- Delete buffer
map('n', '<leader>bd', '<cmd>:bd<cr>')

-- Quit
map('n', '<leader>qq', '<cmd>qa<cr>')
