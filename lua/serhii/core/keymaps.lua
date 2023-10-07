vim.g.mapleader = " "

local keymap = vim.keymap

--unset
keymap.set("n", "<C-z>", "")

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>of", ":NvimTreeFindFile<CR>")

-- searching
local builtin = require('telescope.builtin')

keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fk", builtin.keymaps, {}) -- list available help tags

-- move lines up & down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append current line up/down without moving cursor
-- keymap.set("n", "J", "mzJ`z")

-- buffers
keymap.set("n", "<leader>bd", ":bdelete<CR>")
keymap.set("n", "<leader>bad", ":%bdelete<CR>")
keymap.set("n", "L", ":bnext<CR>")
keymap.set("n", "H", ":bprevious<CR>")

-- lsp
keymap.set("n", "<leader>g.", vim.lsp.buf.code_action, {})

-- spectre
--
keymap.set("n", '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre"
})
keymap.set("n", '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
keymap.set("v", '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
keymap.set("n", '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})

-- find next occurace of the word
keymap.set("n", '<leader>d', '*')

-- copy relative path to clipboard
vim.api.nvim_create_user_command("Cppath", function()
    local path = vim.fn.expand("%:.")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})


vim.api.nvim_create_user_command("CpRemotePath", function()
  local remote = vim.fn.system("git config --get remote.origin.url"):gsub("git@", ""):gsub(".git", ""):gsub(":", "/"):gsub("\n", "")
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  local relative_to_git = vim.fn.expand("%:.")
  local cursor_row_number = vim.fn.line('.')

  local res = 'https://' .. remote .. '/blob/' .. branch .. '/' .. relative_to_git .. '#L' .. cursor_row_number

  vim.fn.setreg("+", res)
  vim.notify('Copied "' .. res .. '" to the clipboard!')
end, {})

keymap.set("n", "<leader>rp", ":Cppath<CR>")
keymap.set("n", "<leader>gp", ":CpRemotePath<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- experimental
