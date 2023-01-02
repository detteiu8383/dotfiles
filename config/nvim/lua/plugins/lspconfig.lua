return function()
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
      end,
    },
  })

  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    callback = function()
      vim.lsp.buf.format({ async = false })
    end,
  })

  -- mapping
  require("which-key").register({
    name = "lsp",
    ["<space>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics in a floating window" },
    ["[d"] = {
      "<cmd>lua vim.diagnostic.goto_prev()<CR>",
      "Move to the previous diagnostic in the current buffer",
    },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Move to the next diagnostic" },
    ["<space>q"] = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Add buffer diagnostics to the location list" },
  })
end
