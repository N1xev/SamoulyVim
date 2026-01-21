---@type LazySpec
-- NOTE: Statusline configuration with Tmux integration
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = vim.env.TMUX and { "christopher-francisco/tmux-status.nvim", lazy = false } or {},
    init = function()
      -- Use a global statusline for the seamless "single bar" look
      vim.opt.laststatus = 3
    end,
    opts = function()
      -- PERF: keep your specific LazyVim require logic
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons
      local tmux_ok, tmux = pcall(require, "tmux-status")

      -- Helper to prevent errors when not in a Tmux session
      local function is_tmux()
        return tmux_ok and vim.env.TMUX ~= nil
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            -- SESSION BEFORE MODE
            { tmux_ok and tmux.tmux_session or "", cond = is_tmux },
            "mode",
          },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),

            { "filetype", icon_only = true, padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
            -- PUSHES WINDOWS TO THE MIDDLE
            "%=",
            { tmux_ok and tmux.tmux_windows or "", cond = is_tmux },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            Snacks.profiler.status(),
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
            {
              "diff",
              symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", padding = { left = 1, right = 1 } },
            { "location", padding = { left = 1, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }
    end,
  },

  {
    "christopher-francisco/tmux-status.nvim",
    cond = vim.env.TMUX ~= nil,
    opts = {
      sync_tmux_status = true,
      window = {
        separator = "⋮",
        icon_zoom = "",
        icon_mark = "",
        icon_bell = "",
        icon_mute = "",
        icon_activity = "",
        text = "dir",
      },
      session = {
        icon = "",
      },
      datetime = {
        icon = "󱑍",
        format = "%a %d %b %k:%m",
      },
      battery = {
        icon = "󰂎",
      },
      force_show = true,
      manage_tmux_status = true,
    },
  },
}
