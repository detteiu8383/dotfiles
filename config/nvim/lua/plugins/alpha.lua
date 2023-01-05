return function()
  local alpha = require("alpha")
  local startify_config = require("alpha.themes.startify").config

  -- local header = {
  --   type = "text",
  --   val = "test",
  --   opts = {
  --     hl = "Type",
  --     shrink_margin = false,
  --   }
  -- }

  -- -- set header
  -- startify_config.layout[2] = header

  alpha.setup(startify_config)
end
