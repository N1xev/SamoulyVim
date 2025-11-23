return {
  "akinsho/bufferline.nvim",
  enabled = true,
  event = "BufReadPre", -- or "VimEnter" for project start
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {
      options = {
        -- mode = "tabs",
        offsets = {
          {
            filetype = "NvimTree",
            text = "Garden",
            separator = false,
            text_align = "center",
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },

        -- separator_style = "slope",
        diagnostics = "nvim_lsp",
        modified_icon = "●",
        show_close_icon = false,
        show_buffer_close_icons = true,
      },
    }
  end,
}
