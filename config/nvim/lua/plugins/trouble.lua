return function()
  require("trouble").setup({
    mode = "document_diagnostics"
  })

  require("which-key").register({
    x = {
      name = "trouble",
      x = { "<Cmd>TroubleToggle<cr>", "Trouble toggle" },
      w = { "<Cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble toggle workspace_diagnostics" },
      d = { "<Cmd>TroubleToggle document_diagnostics<cr>", "Trouble toggle document_diagnostics" },
      q = { "<Cmd>TroubleToggle quickfix<cr>", "Trouble toggle quickfix" },
      l = { "<Cmd>TroubleToggle loclist<cr>", "Trouble toggle loclist" },
    }
  }, { prefix = "<leader>" })
end
