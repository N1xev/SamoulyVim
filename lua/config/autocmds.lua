-- Save last colorscheme and update tmux status colors
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Save colorscheme
    local file = vim.fn.stdpath("data") .. "/last_colorscheme"
    local name = string.lower(vim.g.colors_name or ""):gsub(" ", "_")
    vim.fn.writefile({ name }, file)

    -- Update tmux status bg/fg to match theme
    if vim.env.TMUX then
      local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
      local bg = normal.bg and string.format("#%06x", normal.bg) or "#000000"
      local fg = normal.fg and string.format("#%06x", normal.fg) or "#ffffff"
      vim.fn.system("tmux set -g status-bg '" .. bg .. "'")
      vim.fn.system("tmux set -g status-fg '" .. fg .. "'")
    end
  end,
})

-- Auto-open nvim-tree when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
