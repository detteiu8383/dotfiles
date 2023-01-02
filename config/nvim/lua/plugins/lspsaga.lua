return function()
  require("lspsaga").init_lsp_saga({
    code_action_icon = "💡",
  })

  require("which-key").register({
    K = { '<Cmd>Lspsaga hover_doc<CR>', 'lspsaga show hover doc' },
    ['g'] = {
      name = 'lspsaga',
      r = { '<Cmd>Lspsaga rename<CR>', 'lspsaga rename' },
      h = { '<Cmd>Lspsaga lsp_finder<CR>', 'lspsaga finder' },
      a = { '<Cmd>Lspsaga code_action<CR>', 'lspsaga codeaction' },
      d = { '<Cmd>Lspsaga peek_definition<CR>', 'lspsaga peek definision' },
    }
  }, {
    silent = true,
  })

  require('which-key').register({
    ['g'] = {
      name = 'lspsaga',
      a = { '<Cmd><C-U>Lspsaga range_code_action<CR>', 'lspsaga range codeaction' }
    }
  }, {
    mode = 'v',
    silent = true,
  })
end
