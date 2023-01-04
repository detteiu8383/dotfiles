return function()
  local navic = require("nvim-navic")

  require("lualine").setup({
    options = {
      globalstatus = true,
      theme = "shado"
    },
    sections = {
      lualine_c = {
        { navic.get_location, cond = navic.is_available },
      }
    }
  })
end
