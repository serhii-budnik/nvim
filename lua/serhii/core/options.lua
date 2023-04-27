local opt = vim.opt

-- vertical line
opt.colorcolumn = "120"

-- folding does not work :\
-- -- opt.foldmethod="expr"
-- -- opt.foldexpr="nvim_treesitter#foldexpr()"
-- -- opt.foldlevel = 20
-- opt.foldcolumn = "1"
-- opt.foldlevel = 99
-- opt.foldlevelstart = -1
-- opt.foldenable = true

opt.scrolloff = 20

-- line numbers

opt.relativenumber = true
opt.number = true

-- tabs & indents

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 2 -- experimental

-- line wrapping

opt.wrap = false

-- search settings

opt.ignorecase = true
opt.smartcase = true

-- cursor line
-- opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.opt.updatetime = 50
