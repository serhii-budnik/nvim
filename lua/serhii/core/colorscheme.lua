vim.o.background = 'light'

local c = require('vscode.colors').get_colors()
local darkBlue = '#001080'
local constColor = '#257f99'
-- local tagColor = '#810403'
-- local tagAttribute = '#e82121'

require('vscode').setup({
  -- Enable italic comment
  italic_comments = false,

  -- Disable nvim-tree background color
  disable_nvimtree_bg = false,

  -- Override colors (see ./lua/vscode/colors.lua)
  color_overrides = {
    vscLineNumber = '#6E7681',
  },

  -- Override highlight groups (see ./lua/vscode/theme.lua)
  group_overrides = {
    -- this supports the same val table as vim.api.nvim_set_hl
    -- use colors from this colorscheme by requiring vscode.colors!
    -- Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },

    ["@symbol.ruby"] = { fg = c.vscBlue, bg = "NONE" },
    ["@variable.ruby"] = { fg = darkBlue, bg = "NONE" },
    -- instance & class variables
    ["@label.ruby"] = { fg = darkBlue, bg = "NONE" },
    ["@keyword.function.ruby"] = { fg = c.vscPink, bg = "NONE" },
    ["@type.ruby"] = { fg = constColor, bg = "NONE" },

    ["@string"] = { fg = '#a31414', bg = "NONE" },
    ["@string.regex"] = { fg = c.vscYellowOrange, bg = "NONE" },

    ["@constructor"] = { fg = constColor, bg = "NONE" },
    ["@constant"] = { fg = constColor, bg = "NONE" },
  }
})
require('vscode').load()
