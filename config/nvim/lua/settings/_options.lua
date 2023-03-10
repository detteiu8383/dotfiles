-- https://vim-jp.org/vimdoc-ja/options.html
local o = vim.opt

o.ambiwidth = "single"
o.background = "dark"
o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 2
o.completeopt = { "menuone", "noselect" }
o.conceallevel = 0
o.cursorline = true
o.encoding = "utf-8"
o.expandtab = true
o.fileencoding = "utf-8"
o.hlsearch = true
o.ignorecase = true
o.laststatus = 3
o.mouse = "a" -- all previous modes
o.number = true
o.numberwidth = 4
o.pumblend = 5 -- transparency for the popup-menu
o.pumheight = 10
o.relativenumber = false
o.scrolloff = 8
o.shiftwidth = 2
o.showtabline = 2
o.sidescrolloff = 8
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 300
o.title = true
o.undofile = true
o.updatetime = 300
o.whichwrap = "bshl<>[]~"
o.wildoptions = "pum"
o.winblend = 0
o.wrap = false
o.writebackup = false

if vim.fn.executable("win32yank.exe") then
  vim.g.clipboard = {
    name = "myClipboard",
    copy = {
      ["+"] = { "win32yank.exe", "-i" },
      ["*"] = { "win32yank.exe", "-i" },
    },
    paste = {
      ["+"] = { "win32yank.exe", "-o" },
      ["*"] = { "win32yank.exe", "-o" },
    },
    cache_enabled = true,
  }
end
