---@type LazyVimConfig
-- NOTE: Native Neovim options and global settings
-- Concealing (for markdown, latex, etc)
vim.opt.conceallevel = 2 -- Set to 0 to see `` in markdown files

-- Session options
vim.opt.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds"

-- Set default shell
vim.opt.shell = vim.fn.has("win32") == 1 and "powershell" or "bash"
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
