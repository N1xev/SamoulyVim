return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = vim.env.TMUX and { "christopher-francisco/tmux-status.nvim" } or {},
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

      local function get_color(hl_group, attr)
        local hl = vim.api.nvim_get_hl(0, { name = hl_group })
        return hl[attr] and string.format("#%06x", hl[attr]) or nil
      end

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
              function()
                local ok, noice = pcall(require, "noice")
                if not ok then return "" end
                local status = noice.api and noice.api.status
                local cmd_status = status and status.command
                return type(cmd_status) == "function" and cmd_status() or ""
              end,
              cond = function()
                local ok, noice = pcall(require, "noice")
                if not ok then return false end
                local status = noice.api and noice.api.status
                local cmd_status = status and status.command
                local has_method = type(cmd_status) == "function" and cmd_status()
                return type(has_method) ~= "table" and has_method ~= ""
              end,
              color = function() return { fg = Snacks.util.color("Statement") } end,
            },
            -- stylua: ignore
            {
              function()
                local ok, noice = pcall(require, "noice")
                if not ok then return "" end
                local status = noice.api and noice.api.status
                local mode_status = status and status.mode
                return type(mode_status) == "function" and mode_status() or ""
              end,
              cond = function()
                local ok, noice = pcall(require, "noice")
                if not ok then return false end
                local status = noice.api and noice.api.status
                local mode_status = status and status.mode
                local has_method = type(mode_status) == "function" and mode_status()
                return type(has_method) ~= "table" and has_method ~= ""
              end,
              color = function() return { fg = Snacks.util.color("Constant") } end,
            },
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
    opts = function()
      local function get_color(hl_group, attr)
        local hl = vim.api.nvim_get_hl(0, { name = hl_group })
        return hl[attr] and string.format("#%06x", hl[attr]) or nil
      end
      return {
        sync_tmux_status = true,
        window = {
          separator = "⋮",
          icon_zoom = "",
          icon_mark = "",
          icon_bell = "",
          icon_mute = "",
          icon_activity = "",
          -- "dir" | "name" | "index_name"
          -- if not listed above, text will be passed directly to tmux formatting
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
        colors = {
          window_active = { fg = get_color("Directory", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
          window_inactive = { fg = get_color("Comment", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
          window_inactive_recent = { fg = get_color("LineNr", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
          session = { fg = get_color("Title", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
          datetime = { fg = get_color("Special", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
          battery = { fg = get_color("WarningMsg", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
        },
        force_show = true, -- Force components to be shown regardless of Tmux status
        manage_tmux_status = true, -- Set to false if you do NOT want the plugin to turn Tmux status on/off
      }
    end,
  },
}
