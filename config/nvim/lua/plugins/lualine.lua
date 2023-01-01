return function()
  require("lualine").setup({
    options = {
      disabled_filetypes = {
        statusline = { "neo-tree" }
      }
    }
  })
end
