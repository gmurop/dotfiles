-- leader key
vim.g.mapleader = ','

-- Misc
vim.keymap.set({ 'n' }, '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set({ 'i' }, '<leader>c', '<Esc>')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>d', ':Rexplore<cr>', { silent = true })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>n', '<cmd>bn<cr>')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>p', '<cmd>bp<cr>')
vim.keymap.set({ 'n' }, '<leader>w', '<cmd>write<cr>')
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y')
vim.keymap.set({ 'n', 'x' }, 'gp', '"+p')

-- fzf-lua
vim.keymap.set('n', '<c-B>', "<cmd>lua require('fzf-lua').buffers()<cr>", { silent = true })
vim.keymap.set('n', '<c-G>', "<cmd>lua require('fzf-lua').live_grep()<cr>", { silent = true })
vim.keymap.set('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })

-- Diagnostics
vim.keymap.set({'n'}, '<space>o', vim.diagnostic.open_float, { desc = 'diagnostic.open_float' })
vim.keymap.set({'n'}, '<space>n', vim.diagnostic.goto_next)
vim.keymap.set({'n'}, '<space>p', vim.diagnostic.goto_prev)
vim.keymap.set({'n'}, '<space>l', vim.diagnostic.setloclist)

-- Lsp
local function set_lsp_keybindings(ev)
	-- Buffer local mappings
	-- See `:help vim.lsp.*` for documontation on any of the below functions
	local opts = { buffer = ev.buf }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set({ 'n', 'v' }, '<space>f', function()
	  vim.lsp.buf.format { async = true }
	end, opts)

	-- Todo: Investigate how to use workspaces
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set('n', '<space>wl', function()
	  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
end

return {
	set_lsp_keybindings = set_lsp_keybindings
}
