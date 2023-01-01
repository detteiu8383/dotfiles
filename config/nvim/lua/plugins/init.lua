local utils = require("libraries._set_config")
local conf = utils.conf

-- lazy.nvim
-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",

  -- color scheme
  {
    'folke/tokyonight.nvim',
    config = conf("tokyonight"),
    lazy = false,
    priority = 1000,
  },

  -- file manager
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = conf("neo-tree")
  },

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    config = conf("lualine")
  }
})
