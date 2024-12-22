-- Lanzar Telescope con S-f
vim.api.nvim_set_keymap('n', 'F', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Lanzar Nvim-Tree con Ctrl-t
vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-T>', ':NvimTreeClose<CR>', { noremap = true, silent = true })

-- Goto buffer in position X (Barbar)
vim.api.nvim_set_keymap('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-0>', '<Cmd>BufferLast<CR>', { noremap = true, silent = true })
