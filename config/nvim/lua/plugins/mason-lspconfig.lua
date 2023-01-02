return function()
  require("mason-lspconfig").setup_handlers({
    function(server)
      local opt = {
        on_attach = function(client, bufnr)
          require('which-key').register({
            name = 'lsp',
            ['gD'] = { '<cmd>lua vim.lsp.buf.declaration()<CR>',
              'Jumps to the declaration of the symbol under the cursor' },
            ['gd'] = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Jumps to the definition of the symbol under the cursor' },
            ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>',
              'Displays hover information about the symbol under the cursor in a floating window' },
            ['gi'] = { '<cmd>lua vim.lsp.buf.implementation()<CR>',
              'Lists all the implementations for the symbol under the cursor in the quickfix window' },
            ['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>',
              'Displays signature information about the symbol under the cursor in a floating window' },
            ['<space>wa'] = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
              'Add the folder at path to the workspace folders' },
            ['<space>wr'] = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
              'Remove the folder at path from the workspace folders' },
            ['<space>wl'] = { '<cmd>lua print(vim.insatpect(vim.lsp.buf.list_workspace_folders()))<CR>',
              'List workspace folders' },
            ['<space>D'] = { '<cmd>lua vim.lsp.buf.type_definition()<CR>',
              'Jumps to the definition of the type of the symbol under the cursor' },
            ['<space>rn'] = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename old_fname to new_fname' },
            ['<space>ca'] = { '<cmd>lua vim.lsp.buf.code_action()<CR>',
              'Selects a code action available at the current cursor position' },
            ['gr'] = { '<cmd>lua vim.lsp.buf.references()<CR>',
              'Lists all the references to the symbol under the cursor in the quickfix window' },
            ['<space>f'] = { '<cmd>lua vim.lsp.buf.format()<CR>', 'Formats the current buffer' },
          }, {
            buffer = 0,
          })

          require('illuminate').on_attach(client)

          vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format()'
        end
      }

      require("lspconfig")[server].setup(opt)
    end
  })
end
