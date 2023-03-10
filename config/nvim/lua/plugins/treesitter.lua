return function()
  if vim.fn.exepath('tree-sitter') ~= '' then
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "css",
        "html",
        "lua",
        "scss",
        "tsx",
        "typescript",
        "yaml",
      },
      highlight = {
        enable = true,
        disable = { "TelescopePrompt" },
      },
      indent = {
        enable = true,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      }
    }
  else
    print('brew install tree-sitter')
  end
end
