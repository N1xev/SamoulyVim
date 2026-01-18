-- Line numbers
vim.opt.relativenumber = true -- Relative line numbers (great for navigation)
vim.opt.number = true -- Show absolute line number on current line

-- Tabs & Indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (adjust to your preference: 2 or 4)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- Expand tab to spaces
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Smart autoindenting

-- Line wrapping
vim.opt.wrap = false -- Disable line wrapping (personal preference)

-- Search settings
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- If you include mixed case, assumes case-sensitive

-- Cursor line
vim.opt.cursorline = true -- Highlight current line

-- Appearance
vim.opt.termguicolors = true -- True color support
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.pumheight = 10 -- Pop up menu height (completion menu)

-- Backspace
vim.opt.backspace = "indent,eol,start" -- Allow backspace on everything

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Split windows
vim.opt.splitright = true -- Split vertical window to the right
vim.opt.splitbelow = true -- Split horizontal window to the bottom

-- Scroll
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor when scrolling
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor

-- Performance
vim.opt.updatetime = 250 -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 300 -- Time to wait for mapped sequence (ms)

-- Undo & Backup
vim.opt.undofile = true -- Enable persistent undo
vim.opt.swapfile = false -- Disable swap file
vim.opt.backup = false -- Disable backup

-- Mouse
vim.opt.mouse = "a" -- Enable mouse support

-- Concealing (for markdown, latex, etc)
vim.opt.conceallevel = 2 -- Set to 0 to see `` in markdown files

-- Session options
vim.opt.sessionoptions = "buffers,curdir,tabpages,winsize,help,globals,skiprtp,folds"

-- Set default shell
vim.opt.shell = "nu"
vim.opt.shellcmdflag = "-c"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
