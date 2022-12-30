-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local options = {
    ambiwidth = "double",
    background = "dark",
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = {"menuone", "noselect"},
    conceallevel = 0,
    cursorline = true,
    encoding = "utf-8",
    expandtab = true,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = true,
    mouse = "a", -- all previous modes
    number = true,
    numberwidth = 4,
    pumblend = 5, -- transparency for the popup-menu
    pumheight = 10,
    relativenumber = false,
    scrolloff = 8,
    shiftwidth = 2,
    showtabline = 2,
    sidescrolloff = 8,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    swapfile = false,
    tabstop = 2,
    termguicolors = true,
    timeoutlen = 300,
    title = true,
    undofile = true,
    updatetime = 300,
    whichwrap = "b,s,h,l,<,>,[,],~",
    wildoptions = "pum",
    winblend = 0,
    wrap = false,
    writebackup = false
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
