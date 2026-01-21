---@type LazySpec

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
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      term_colors = true,
      color_overrides = {
        mocha = {
          base = "#05070f",
          mantle = "#05070f",
          crust = "#05070f",
        },
      },
    },
  },
  {
    "uhs-robert/oasis.nvim",
  },
  {
    "dasupradyumna/midnight.nvim",
  },
}
