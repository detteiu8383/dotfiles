return function()
  require("neo-tree").setup({
    default_component_configs = {
      indent = {
        last_indent_marker = "└ ",
      }
    }
  })

  -- vim.cmd Your <leader> key ([[nnoremap \ :Neotree reveal<cr>]])
  require("which-key").register({
    ["<leader>t"] = { "<Cmd>Neotree toggle<cr>", "Neotree toggle open / close" },
    ["<leader>e"] = { "<Cmd>Neotree reveal<cr>", "Neotree focus explorer" },
  })
end
