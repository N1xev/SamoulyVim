return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    -- Use sensible defaults with custom open_mapping
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = false,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      width = 0.7,
      height = 0.7,
      winblend = 3,
    },
  },
  keys = {
    -- Disable default terminal mappings to use our own
    { "<leader>ft", false },
    { "<leader>fT", false },

    -- Use built-in commands with our preferred keymaps
    {
      "<leader>Tf",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "float" }):toggle()
      end,
      desc = "Float Terminal",
    },
    {
      "<leader>Th",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "horizontal" }):toggle()
      end,
      desc = "Horizontal Terminal",
    },
    {
      "<leader>Tv",
      function()
        require("toggleterm.terminal").Terminal:new({ direction = "vertical" }):toggle()
      end,
      desc = "Vertical Terminal",
    },
    {
      "<leader>Tt",
      function()
        require("toggleterm").toggle()
      end,
      desc = "Toggle Terminal",
    },

    -- Terminal management using built-in commands
    {
      "<leader>TH",
      function()
        vim.cmd("ToggleTermCloseAll")
        vim.notify("Closed all terminals", vim.log.levels.INFO)
      end,
      desc = "Close All Terminals",
    },
    {
      "<leader>TV",
      function()
        vim.cmd("ToggleTermCloseAll")
        vim.notify("Closed all terminals", vim.log.levels.INFO)
      end,
      desc = "Close All Terminals",
    },
    {
      "<leader>Tk",
      function()
        vim.cmd("ToggleTermToggleAll")
      end,
      desc = "Toggle All Terminals",
    },
    {
      "<leader>TK",
      function()
        vim.cmd("ToggleTermCloseAll")
        vim.notify("Killed all terminals", vim.log.levels.INFO)
      end,
      desc = "Kill All Terminals",
    },
    {
      "<leader>Ts",
      function()
        vim.cmd("TermSelect")
      end,
      desc = "Select Terminal",
    },

    -- Quick terminals
    {
      "<leader>Tn",
      function()
        require("toggleterm.terminal").Terminal:new({ cmd = "node" }):toggle()
      end,
      desc = "Node Terminal",
    },
    {
      "<leader>Tp",
      function()
        require("toggleterm.terminal").Terminal:new({ cmd = "python3" }):toggle()
      end,
      desc = "Python Terminal",
    },
    {
      "<leader>Tg",
      function()
        require("toggleterm.terminal").Terminal:new({ cmd = "lazygit" }):toggle()
      end,
      desc = "LazyGit Terminal",
    },
  },
}
