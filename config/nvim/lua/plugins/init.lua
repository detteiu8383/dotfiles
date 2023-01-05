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
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = conf("nightfox"),
  --   lazy = false,
  --   priority = 1000
  -- },
  {
    "Shadorain/shadotheme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme shado")
    end,
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

  -- dashboard
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = conf("alpha")
  },

  -- comment
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        }
      })
    end
  },

  -- unit selection
  {
    "David-Kunz/treesitter-unit",
    config = conf("treesitter-unit"),
    dependencies = { "nvim-treesitter/nvim-treesitter" }
  },

  -- auto close brackets
  {
    "windwp/nvim-autopairs",
    config = conf("autopairs"),
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },

  -- search
  {
    "kevinhwang91/nvim-hlslens",
    config = conf("hlslens")
  },

  -- key mapping
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
    lazy = true
  },

  -- git
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup({
        -- customize displayed signs
        signs = {
          -- { CLOSED, OPENED }
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
        integrations = {
          diffview = true
        }
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
      require("scrollbar.handlers.gitsigns").setup({})
    end,
    dependencies = {
      "petertriho/nvim-scrollbar"
    }
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "kkharji/sqlite.lua"
    },
    config = conf("telescope")
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

  {
    "SmiteshP/nvim-navic",
    dependencies = {
      "neovim/nvim-lspconfig"
    }
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
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
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind.nvim" },
    },
  },
})
