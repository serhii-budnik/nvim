-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
require('telescope').setup({
  -- configure custom mappings
  defaults = {
    mappings = {
      i = {
        -- ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        -- ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      },
    },
    preview = true,
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = false,
      case_mode = "smart_case", -- or "ignore_case" or "respect_case". the default case_mode is "smart_case"
    }
  }
})

require('telescope').load_extension('fzf')
