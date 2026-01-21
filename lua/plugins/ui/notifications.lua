---@type LazySpec
-- NOTE: Notification and UI message management (Noice + Snacks)
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "written" },
              { find = "%d+L, %d+B" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = true,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = true,
        timeout = 3000,
      },
    },
  },
}
