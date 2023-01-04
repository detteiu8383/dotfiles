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

  "github/copilot.vim",

  -- color scheme
  -- {
  --   'folke/tokyonight.nvim',
  --   config = conf("tokyonight"),
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "EdenEast/nightfox.nvim",
    config = conf("nightfox"),
    lazy = false,
    priority = 1000
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end,
  },

  {
    "unblevable/quick-scope",
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = conf("treesitter"),
    build = ":TSUpdate",
  },

  -- auto close brackets
  {
    "windwp/nvim-autopairs",
    config = conf("autopairs"),
  },

  -- key mapping
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },

  -- file manager
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = conf("neo-tree")
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = conf("bufferline")
  },

  -- scrollbar
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({})
    end
  },

  -- status bar
  {
    "nvim-lualine/lualine.nvim",
    config = conf("lualine")
  },

  {
    "folke/trouble.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = conf("trouble")
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    config = conf("lspconfig"),
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "RRethy/vim-illuminate",
    },
  },

  {
    "williamboman/mason.nvim",
    config = conf("mason"),
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      config = conf("mason-lspconfig")
    }
  },

  {
    "kkharji/lspsaga.nvim",
    config = conf("lspsaga"),
    branch = "main",
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    config = conf("nvim-cmp"),
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig" },
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-emoji", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
      { "onsails/lspkind.nvim" },
    },
  },
})
