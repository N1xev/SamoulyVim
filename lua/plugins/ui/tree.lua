-- NOTE: File Explorer

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "<C-C>", api.tree.change_root_to_node, opts("CD"))
end

-- NOTE: File Explorer
return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    keys = {
      -- Example keybinds
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
    },
    cmd = {
      "NvimTreeOpen",
      "NvimTreeToggle",
      "NvimTreeFocus",
      "NvimTreeFindFile",
      "NvimTreeFindFileToggle",
    },
    opts = {
      on_attach = on_attach,
      hijack_cursor = true, -- Moved inside opts
      sync_root_with_cwd = true, -- Moved inside opts
      hijack_netrw = true,
      diagnostics = {
        enable = true,
      },
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 5000,
      },
      view = {
        side = "right", -- This moves the tree to the right
        width = 30,
        preserve_window_proportions = true,
      },
      renderer = {
        highlight_git = true,
        root_folder_label = function(path)
          return "✦  " .. vim.fn.fnamemodify(path, ":t")
        end,
        indent_width = 2,
        icons = {
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = false,
              color = false,
            },
          },

          show = {
            hidden = true,
          },
          git_placement = "after",
          bookmarks_placement = "after",
          symlink_arrow = " -> ",
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            default = "󱓻",
            symlink = "󱓻",
            bookmark = "",
            modified = "",
            hidden = "󱙝",
            git = {
              unstaged = "×",
              staged = "",
              unmerged = "󰧾",
              untracked = "",
              renamed = "",
              deleted = "",
              ignored = "∅",
            },
          },
        },
        indent_markers = {
          enable = false,
        },
      },
    },
    hijack_cursor = true,
    sync_root_with_cwd = true,
  },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
    },
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
    },
  },
}
