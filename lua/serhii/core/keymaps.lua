vim.g.mapleader = " "

local keymap = vim.keymap

--unset
keymap.set("n", "<C-z>", "")

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "<leader>q", ":nohl<CR>")

-- keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>of", ":NvimTreeFindFile<CR>")

-- move lines up & down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- buffers
keymap.set("n", "<leader>bd", ":bdelete!<CR>")
keymap.set("n", "<leader>bad", ":%bdelete!<CR>")

-- lsp
keymap.set("n", "<leader>g.", vim.lsp.buf.code_action, {})
keymap.set("n", "<leader>.", vim.lsp.buf.code_action, {})
keymap.set("n", "g.", vim.lsp.buf.code_action, {})

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

local function get_relative_path(with_cursor_row_number)
    local path = vim.fn.expand("%:.")

    if with_cursor_row_number then
        path = path .. ":" .. vim.fn.line('.')
    end

    return path
end

-- copy relative path to clipboard
vim.api.nvim_create_user_command("CopyRelativePath", function()
    local path = get_relative_path(false)
    vim.fn.setreg("+", path)
    vim.notify('copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("CopyRelativePathWithRowNumber", function()
    local path = get_relative_path(true)
    vim.fn.setreg("+", path)
    vim.notify('copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command("CopyRemotePath", function()
  local remote = vim.fn.system("git config --get remote.origin.url"):gsub("git@", ""):gsub(".git", ""):gsub(":", "/"):gsub("\n", "")
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")
  local relative_to_git = vim.fn.expand("%:.")
  local cursor_row_number = vim.fn.line('.')

  local res = 'https://' .. remote .. '/blob/' .. branch .. '/' .. relative_to_git .. '#L' .. cursor_row_number

  vim.fn.setreg("+", res)
  vim.notify('Copied "' .. res .. '" to the clipboard!')
end, {})

keymap.set("n", "<leader>rp", ":CopyRelativePath<CR>")
keymap.set("n", "<leader>rlp", ":CopyRelativePathWithRowNumber<CR>")
keymap.set("n", "<leader>gp", ":CopyRemotePath<CR>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- experimental
