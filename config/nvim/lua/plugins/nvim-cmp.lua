return function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-q>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<UP>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior }),
      ['<DOWN>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior })
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp_document_symbol' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'emoji' },
    }),
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50,
        before = function(entry, vim_item)
          return vim_item
        end
      })
    },
    window = {
      completion = cmp.config.window.bordered({
        border = "rounded",
        scrollbar = '║'
      }),
      documentation = {
        border = 'rounded',
        scrollbar = '║',
      },
    }
  })

  -- `/` cmdline setup.
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- `:` cmdline setup.
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      {
        name = 'cmdline',
      }
    })
  })
end
