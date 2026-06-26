-- VSCode Neovim integration configuration
-- This file is loaded when Neovim is started from VSCode

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.opt.mouse = 'a'
vim.opt.scroll = 5
vim.opt.autoindent = true
vim.opt.scrolloff = 10

-- Leader key
vim.g.mapleader = ','

-- VSCode-specific keybindings
local function vscode_notify(method, params)
  return vim.fn.VSCodeNotify(method, params)
end

local function vscode_call(method, params)
  return vim.fn.VSCodeCall(method, params)
end

-- Misc keybindings from your original config
vim.keymap.set({ 'n' }, '<leader>a', function() vscode_notify('editor.action.selectAll') end)
vim.keymap.set({ 'i' }, '<leader>c', '<Esc>')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
vim.keymap.set({ 'n' }, '<leader>w', function() vscode_notify('workbench.action.files.save') end)
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y')
vim.keymap.set({ 'n', 'x' }, 'gp', '"+p')

-- Zed keybindings mapped to VSCode
vim.keymap.set('n', 'gd', function() vscode_notify('editor.action.revealDefinition') end)
vim.keymap.set('n', 'gD', function() vscode_notify('editor.action.goToTypeDefinition') end)
vim.keymap.set('n', 'g_', function() vscode_notify('references-view.find') end)
vim.keymap.set('n', 'g-', function() vscode_notify('workbench.view.explorer') end)
vim.keymap.set('n', 'gr', function() vscode_notify('editor.action.rename') end)
vim.keymap.set('n', 'g\\', function() vscode_notify('workbench.action.quickOpen') end)
vim.keymap.set('n', 'gy', function() vscode_notify('copyFilePath') end)

-- Diagnostic navigation
vim.keymap.set('n', '<space>n', function() vscode_notify('editor.action.marker.next') end)
vim.keymap.set('n', '<space>N', function() vscode_notify('editor.action.marker.prev') end)
vim.keymap.set('n', '<space>c', function() vscode_notify('workbench.action.editor.nextChange') end)
vim.keymap.set('n', '<space>C', function() vscode_notify('workbench.action.editor.previousChange') end)

-- File operations
vim.keymap.set('n', '<leader>w', function() vscode_notify('workbench.action.files.save') end)
vim.keymap.set('n', '<leader>W', function() vscode_notify('workbench.action.files.saveAll') end)
vim.keymap.set('n', '<leader>m', function() vscode_notify('editor.foldAll') end)
vim.keymap.set('n', '<leader>r', function() vscode_notify('editor.unfoldAll') end)
vim.keymap.set('n', '<leader>t', function() vscode_notify('git.stageSelectedRanges') end)
vim.keymap.set('n', '<leader>d', function() vscode_notify('git.openChange') end)
vim.keymap.set('n', '<leader>z', function() vscode_notify('undo') end)

-- Navigation
vim.keymap.set('n', '<C-o>', function() vscode_notify('workbench.action.navigateBack') end)
vim.keymap.set('n', '<C-i>', function() vscode_notify('workbench.action.navigateForward') end)

-- Disable plugins that don't make sense in VSCode
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
