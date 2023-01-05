return function()
  require("hlslens").setup()

  require("which-key").register({
    name = "hlslens",
    ["n"] = { "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", "hlslens next" },
    ["N"] = { "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", "hlslens prev" },
    ["*"] = { "*<Cmd>lua require('hlslens').start()<CR>", "hlslens" },
    ["#"] = { "#<Cmd>lua require('hlslens').start()<CR>", "hlslens" },
    ["g*"] = { "g*<Cmd>lua require('hlslens').start()<CR>", "hlslens" },
    ["g#"] = { "g#<Cmd>lua require('hlslens').start()<CR>", "hlslens" },
    ["<Leader>l"] = { "<Cmd>noh<CR>", "hlslens quit" },
  }, {
    mode = "n",
    noremap = true,
    silent = true
  })
end
