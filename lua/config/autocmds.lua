local group = vim.api.nvim_create_augroup("SamoulyVim", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = function()
    local file = vim.fn.stdpath("data") .. "/last_colorscheme"
    local name = string.lower(vim.g.colors_name or ""):gsub(" ", "_")
    vim.fn.writefile({ name }, file)
  end,
})
