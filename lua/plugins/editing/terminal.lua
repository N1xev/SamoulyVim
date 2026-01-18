return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      enabled = false,
    },
  },
  keys = {
    { "<leader>ft", false },
    { "<leader>fT", false },

    -- Float toggle
    {
      "<leader>Tf",
      function()
        local floats = {}
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "snacks_terminal" then
            local win = vim.fn.bufwinid(buf)
            if win ~= -1 and vim.api.nvim_win_get_config(win).relative then
              table.insert(floats, win)
            end
          end
        end

        if #floats > 0 then
          for _, win in ipairs(floats) do
            vim.api.nvim_win_hide(win)
          end
        else
          Snacks.terminal(nil, { win = { position = "float", height = 0.9, width = 0.9, backdrop = 60, zindex = 50 } })
        end
      end,
      desc = "Float Terminal (Toggle)",
    },

    -- New terminals
    {
      "<leader>Th",
      function()
        Snacks.terminal(nil, { split = "below" })
      end,
      desc = "New Horizontal Terminal",
    },
    {
      "<leader>Tv",
      function()
        Snacks.terminal(nil, { split = "vertical" })
      end,
      desc = "New Vertical Terminal",
    },

    -- Close split terminals (horizontal/vertical both use same)
    {
      "<leader>TH",
      function()
        local closed = 0
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "snacks_terminal" then
            local win = vim.fn.bufwinid(buf)
            if win ~= -1 and not vim.api.nvim_win_get_config(win).relative then
              vim.api.nvim_win_close(win, true)
              closed = closed + 1
            end
          end
        end
        if closed > 0 then
          vim.notify("Closed " .. closed .. " terminal(s)", vim.log.levels.INFO)
        else
          vim.notify("No terminals found", vim.log.levels.WARN)
        end
      end,
      desc = "Close Horizontal Terminals",
    },

    {
      "<leader>TV",
      function()
        local closed = 0
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "snacks_terminal" then
            local win = vim.fn.bufwinid(buf)
            if win ~= -1 and not vim.api.nvim_win_get_config(win).relative then
              vim.api.nvim_win_close(win, true)
              closed = closed + 1
            end
          end
        end
        if closed > 0 then
          vim.notify("Closed " .. closed .. " terminal(s)", vim.log.levels.INFO)
        else
          vim.notify("No terminals found", vim.log.levels.WARN)
        end
      end,
      desc = "Close Vertical Terminals",
    },

    -- General toggle
    {
      "<leader>Tt",
      function()
        Snacks.terminal(nil, { win = { position = "float", height = 0.9, width = 0.9, backdrop = 60, zindex = 50 } })
      end,
      desc = "Toggle Terminal",
    },

    -- Kill current
    {
      "<leader>Tk",
      function()
        if vim.bo[vim.api.nvim_get_current_buf()].filetype == "snacks_terminal" then
          vim.cmd("close")
        else
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[buf].filetype == "snacks_terminal" then
              local win = vim.fn.bufwinid(buf)
              if win ~= -1 then
                vim.api.nvim_win_close(win, true)
                break
              end
            end
          end
        end
      end,
      desc = "Kill Current Terminal",
    },

    -- Kill all
    {
      "<leader>TK",
      function()
        local terminals = {}
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "snacks_terminal" then
            table.insert(terminals, buf)
          end
        end
        for _, buf in ipairs(terminals) do
          local win = vim.fn.bufwinid(buf)
          if win ~= -1 then
            vim.api.nvim_win_close(win, true)
          end
          vim.api.nvim_buf_delete(buf, { force = true })
        end
        vim.notify("Killed " .. #terminals .. " terminal(s)", vim.log.levels.INFO)
      end,
      desc = "Kill All Terminals",
    },

    -- Switch
    {
      "<leader>Ts",
      function()
        local terminals = {}
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].filetype == "snacks_terminal" then
            local name = vim.api.nvim_buf_get_name(buf)
            table.insert(
              terminals,
              { text = name ~= "" and name or "Terminal " .. buf, buf = buf, win = vim.fn.bufwinid(buf) }
            )
          end
        end

        if #terminals == 0 then
          vim.notify("No terminals found", vim.log.levels.WARN)
          return
        end

        if Snacks and Snacks.picker then
          Snacks.picker({
            items = terminals,
            prompt = "Select Terminal",
            format = function(item)
              return item.text
            end,
            confirm = function(picker)
              local selected = picker:find()
              if selected then
                if vim.api.nvim_win_is_valid(selected.win) then
                  vim.api.nvim_set_current_win(selected.win)
                else
                  vim.cmd("split")
                  vim.api.nvim_win_set_buf(0, selected.buf)
                end
              end
            end,
          })
        else
          vim.ui.select(terminals, {
            prompt = "Select Terminal:",
            format_item = function(item)
              return item.text
            end,
          }, function(choice)
            if choice then
              if vim.api.nvim_win_is_valid(choice.win) then
                vim.api.nvim_set_current_win(choice.win)
              else
                vim.cmd("split")
                vim.api.nvim_win_set_buf(0, choice.buf)
              end
            end
          end)
        end
      end,
      desc = "Switch Terminal",
    },
  },
}
