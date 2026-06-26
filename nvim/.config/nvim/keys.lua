-- leader key
vim.g.mapleader = ','

-- Basic
vim.keymap.set({ 'n' }, '<leader>a', ':keepjumps normal! ggVG<cr>')
vim.keymap.set({ 'i' }, '<leader>c', '<Esc>')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
vim.keymap.set({ 'n', 'x', 'o' }, 't', '<cmd>bn<cr>')
vim.keymap.set({ 'n', 'x', 'o' }, 'T', '<cmd>bp<cr>')
vim.keymap.set({ 'n' }, '<C-s>', '<cmd>write<cr>')
vim.keymap.set({ 'n' }, '<C-o>', '<cmd>write<cr>')
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y')
vim.keymap.set({ 'n', 'x' }, 'gp', '"+p')

-- fzf-lua
vim.keymap.set('n', '<c-B>', "<cmd>lua require('fzf-lua').buffers()<cr>", { silent = true })
vim.keymap.set('n', '<c-G>', "<cmd>lua require('fzf-lua').live_grep()<cr>", { silent = true })
vim.keymap.set('n', '<c-P>', "<cmd>lua require('fzf-lua').files()<cr>", { silent = true })

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
