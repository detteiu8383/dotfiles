return function()
  local telescope = require("telescope")

  telescope.setup({})
  telescope.load_extension("frecency")

  require("which-key").register({
    f = {
      name = "telescope",
      f = { "<Cmd>Telescope find_files<cr>", "Telescope find files" },
      g = { "<Cmd>Telescope live_grep<cr>", "Telescope live grep" },
      b = { "<Cmd>Telescope buffers<cr>", "Telescope find buffers" },
      h = { "<Cmd>Telescope help_tags<cr>", "Telescope help tags" },
    }
  }, { prefix = "<leader>" })
end
