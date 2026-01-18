-- Load last colorscheme
local last_file = vim.fn.stdpath("data") .. "/last_colorscheme"
local lines = vim.fn.filereadable(last_file) == 1 and vim.fn.readfile(last_file) or {}
local last_colorscheme = lines[1] and lines[1]:gsub("%s+", "") or nil

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = last_colorscheme or "tailsvim",
    },
  },
}
