local group = vim.api.nvim_create_augroup("SamoulyVim", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = group,
  callback = function()
    local file = vim.fn.stdpath("data") .. "/last_colorscheme"
    local name = string.lower(vim.g.colors_name or ""):gsub(" ", "_")
    vim.fn.writefile({ name }, file)

    if vim.env.TMUX then
      local function get_color(hl_group, attr)
        local hl = vim.api.nvim_get_hl(0, { name = hl_group })
        return hl[attr] and string.format("#%06x", hl[attr]) or nil
      end
      local colors = {
        window_active = {
          fg = get_color("Directory", "fg") or get_color("Normal", "fg"),
          bg = get_color("Normal", "bg"),
        },
        window_inactive = {
          fg = get_color("Comment", "fg") or get_color("Normal", "fg"),
          bg = get_color("Normal", "bg"),
        },
        window_inactive_recent = {
          fg = get_color("LineNr", "fg") or get_color("Normal", "fg"),
          bg = get_color("Normal", "bg"),
        },
        session = { fg = get_color("Title", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
        datetime = { fg = get_color("Special", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
        battery = { fg = get_color("WarningMsg", "fg") or get_color("Normal", "fg"), bg = get_color("Normal", "bg") },
      }
      require("tmux-status").setup({
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
        session = { icon = "" },
        datetime = { icon = "󱑍", format = "%a %d %b %k:%m" },
        battery = { icon = "󰂎" },
        colors = colors,
        force_show = true,
        manage_tmux_status = true,
      })
    end
  end,
})
