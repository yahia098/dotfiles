local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath,
    "--branch=stable",
  })
end
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim", config = function() require("lualine").setup() end },
  { "nvim-tree/nvim-tree.lua"},
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" },},
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  {"lukas-reineke/indent-blankline.nvim",main = "ibl",},
    {'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true ,
    opts = {} , },
    {'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    },
    {"navarasu/onedark.nvim"},
    { "EdenEast/nightfox.nvim" },
})


