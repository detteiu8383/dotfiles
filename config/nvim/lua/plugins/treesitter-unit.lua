return function()
  require("treesitter-unit").enable_highlighting()

  require('which-key').register({
    name = 'treesitter unit',
    ["iu"] = { '<Cmd>lua require("treesitter-unit").select()<CR>', 'treesitter unit select inner' },
    ["au"] = { '<Cmd>lua require("treesitter-unit").select(true)<CR>', 'treesitter unit select around' }
  }, {
    mode = "x",
    silent = true,
    noremap = true,
  })

  require('which-key').register({
    name = 'treesitter unit',
    ["iu"] = { '<Cmd>lua require("treesitter-unit").select()<CR>', 'treesitter unit select inner' },
    ["au"] = { '<Cmd>lua require("treesitter-unit").select(true)<CR>', 'treesitter unit select around' }
  }, {
    mode = "o",
    silent = true,
    noremap = true,
  })
end
