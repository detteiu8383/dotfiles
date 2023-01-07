return function()
  local navic = require("nvim-navic")

  require("lualine").setup({
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        { navic.get_location, cond = navic.is_available },
      }
    }
  })
end
