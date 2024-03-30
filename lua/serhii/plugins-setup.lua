local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")

if not status then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'lourenci/github-colors'
  use 'navarasu/onedark.nvim'

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  use { "ibhagwan/fzf-lua" }

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Requiredplugin-
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }
  -- hightlights
  use("nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')

  use({
    'Wansmer/treesj',
    requires = { 'nvim-treesitter/nvim-treesitter' },
  })

  use 'windwp/nvim-autopairs'
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- essential plugins
  use("tpope/vim-surround")

  -- commenting with gc
  use("numToStr/Comment.nvim")

  use { 'akinsho/bufferline.nvim', tag = "v3.*" }

  use "lukas-reineke/indent-blankline.nvim"

  -- git integration
  use 'lewis6991/gitsigns.nvim'
  use("tpope/vim-fugitive")

  -- find and replace
  use 'windwp/nvim-spectre'

  use 'github/copilot.vim'

  use 'ThePrimeagen/harpoon'

  if packer_bootstrap then
    require("packer").sync()
  end
end)
