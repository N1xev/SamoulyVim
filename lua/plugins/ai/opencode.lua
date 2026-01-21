---@type LazySpec
-- NOTE: OpenCode AI agent integration
return {
  "sudo-tee/opencode.nvim",
  lazy = false,

  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>o", group = "OpenCode" },
    })

    require("opencode").setup({
      preferred_picker = "snacks",
      preferred_completion = "blink",
      default_global_keymaps = true, -- If false, disables all default global keymaps
      default_mode = "build", -- 'build' or 'plan' or any custom configured. @see [OpenCode Agents](https://opencode.ai/docs/modes/)
      keymap_prefix = "<leader>o", -- Default keymap prefix for global keymaps change to your preferred prefix and it will be applied to all keymaps starting with <leader>o
      opencode_executable = "opencode", -- Name of your opencode binary
      keymap = {
        editor = {
          ["<leader>og"] = { "toggle", desc = "Toggle OpenCode window" },
          ["<leader>oi"] = { "open_input", desc = "Open input window (insert mode)" },
          ["<leader>oI"] = { "open_input_new_session", desc = "Open input window (new session)" },
          ["<leader>oo"] = { "open_output", desc = "Open output window" },
          ["<leader>ot"] = { "toggle_focus", desc = "Toggle focus OpenCode/editor" },
          ["<leader>oT"] = { "timeline", desc = "Timeline picker (navigate/undo/fork)" },
          ["<leader>oq"] = { "close", desc = "Close OpenCode UI windows" },
          ["<leader>os"] = { "select_session", desc = "Select OpenCode session" },
          ["<leader>oR"] = { "rename_session", desc = "Rename current session" },
          ["<leader>op"] = { "configure_provider", desc = "Configure provider/model" },
          ["<leader>oz"] = { "toggle_zoom", desc = "Toggle zoom OpenCode windows" },
          ["<leader>ov"] = { "paste_image", desc = "Paste image from clipboard" },
          ["<leader>od"] = { "diff_open", desc = "Open diff tab (modified files)" },
          ["<leader>o]"] = { "diff_next", desc = "Next file diff" },
          ["<leader>o["] = { "diff_prev", desc = "Previous file diff" },
          ["<leader>oc"] = { "diff_close", desc = "Close diff view" },
          ["<leader>ora"] = { "diff_revert_all_last_prompt", desc = "Revert all (last prompt)" },
          ["<leader>ort"] = { "diff_revert_this_last_prompt", desc = "Revert this file (last prompt)" },
          ["<leader>orA"] = { "diff_revert_all", desc = "Revert all (entire session)" },
          ["<leader>orT"] = { "diff_revert_this", desc = "Revert this file (entire session)" },
          ["<leader>orr"] = { "diff_restore_snapshot_file", desc = "Restore file to snapshot" },
          ["<leader>orR"] = { "diff_restore_snapshot_all", desc = "Restore all files to snapshot" },
          ["<leader>ox"] = { "swap_position", desc = "Swap OpenCode pane left/right" },
          ["<leader>opa"] = { "permission_accept", desc = "Accept permission (once)" },
          ["<leader>opA"] = { "permission_accept_all", desc = "Accept all permissions (current tool)" },
          ["<leader>opd"] = { "permission_deny", desc = "Deny permission request" },
          ["<leader>ott"] = { "toggle_tool_output", desc = "Toggle tool output (diffs/cmd)" },
          ["<leader>otr"] = { "toggle_reasoning_output", desc = "Toggle reasoning output (thinking)" },
          ["<leader>o/"] = { "quick_chat", mode = { "n", "x" }, desc = "Quick chat with context" },
        },
        input_window = {
          ["<cr>"] = { "submit_input_prompt", mode = { "n", "i" }, desc = "Submit prompt" },
          ["<esc>"] = { "close", desc = "Close OpenCode UI" },
          ["<C-c>"] = { "cancel", desc = "Cancel OpenCode request" },
          ["~"] = { "mention_file", mode = "i", desc = "Mention file" },
          ["@"] = { "mention", mode = "i", desc = "Insert mention (file/agent)" },
          ["/"] = { "slash_commands", mode = "i", desc = "Slash commands" },
          ["#"] = { "context_items", mode = "i", desc = "Manage context items" },
          ["<M-v>"] = { "paste_image", mode = "i", desc = "Paste image" },
          ["<C-i>"] = { "focus_input", mode = { "n", "i" }, desc = "Focus input window" },
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" }, desc = "Toggle input/output panes" },
          ["<up>"] = { "prev_prompt_history", mode = { "n", "i" }, desc = "Previous prompt history" },
          ["<down>"] = { "next_prompt_history", mode = { "n", "i" }, desc = "Next prompt history" },
          ["<M-m>"] = { "switch_mode", desc = "Switch mode (build/plan)" },
        },
        output_window = {
          ["<esc>"] = { "close", desc = "Close OpenCode UI" },
          ["<C-c>"] = { "cancel", desc = "Cancel OpenCode request" },
          ["]]"] = { "next_message", desc = "Next message" },
          ["[["] = { "prev_message", desc = "Previous message" },
          ["<tab>"] = { "toggle_pane", mode = { "n", "i" }, desc = "Toggle input/output panes" },
          ["i"] = { "focus_input", mode = "n", desc = "Focus input window (insert)" },
          ["<leader>oS"] = { "select_child_session", desc = "Select child session" },
          ["<leader>oD"] = { "debug_message", desc = "Debug message (raw data)" },
          ["<leader>oO"] = { "debug_output", desc = "Debug output (raw data)" },
          ["<leader>ods"] = { "debug_session", desc = "Debug session (raw data)" },
        },
        permission = {
          accept = "a", -- Accept permission request once (only available when there is a pending permission request)
          accept_all = "A", -- Accept all (for current tool) permission request once (only available when there is a pending permission request)
          deny = "d", -- Deny permission request once (only available when there is a pending permission request)
        },
        session_picker = {
          rename_session = { "<C-r>" }, -- Rename selected session in the session picker
          delete_session = { "<C-d>" }, -- Delete selected session in the session picker
          new_session = { "<C-n>" }, -- Create and switch to a new session in the session picker
        },
        timeline_picker = {
          undo = { "<C-u>", mode = { "i", "n" } }, -- Undo to selected message in timeline picker
          fork = { "<C-f>", mode = { "i", "n" } }, -- Fork from selected message in timeline picker
        },
        history_picker = {
          delete_entry = { "<C-d>", mode = { "i", "n" } }, -- Delete selected entry in the history picker
          clear_all = { "<C-X>", mode = { "i", "n" } }, -- Clear all entries in the history picker
        },
        model_picker = {
          toggle_favorite = { "<C-f>", mode = { "i", "n" } },
        },
        mcp_picker = {
          toggle_connection = { "<C-t>", mode = { "i", "n" } }, -- Toggle MCP server connection in the MCP picker
        },
      },
      ui = {
        position = "left", -- 'right' (default), 'left' or 'current'. Position of the UI split. 'current' uses the current window for the output.
        input_position = "bottom", -- 'bottom' (default) or 'top'. Position of the input window
        window_width = 0.40, -- Width as percentage of editor width
        zoom_width = 0.8, -- Zoom width as percentage of editor width
        input_height = 0.15, -- Input height as percentage of window height
        display_model = true, -- Display model name on top winbar
        display_context_size = true, -- Display context size in the footer
        display_cost = true, -- Display cost in the footer
        window_highlight = "Normal:OpencodeBackground,FloatBorder:OpencodeBorder", -- Highlight group for the opencode window
        icons = {
          preset = "nerdfonts", -- 'nerdfonts' | 'text'. Choose UI icon style (default: 'nerdfonts')
          overrides = {}, -- Optional per-key overrides, see section below
        },
        output = {
          tools = {
            show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
            show_reasoning_output = true, -- Show reasoning/thinking steps output (default: true)
          },
          rendering = {
            markdown_debounce_ms = 250, -- Debounce time for markdown rendering on new data (default: 250ms)
            on_data_rendered = nil, -- Called when new data is rendered; set to false to disable default RenderMarkdown/Markview behavior
          },
        },
        input = {
          text = {
            wrap = false, -- Wraps text inside input window
          },
        },
        picker = {
          snacks_layout = nil, -- `layout` opts to pass to Snacks.picker.pick({ layout = ... })
        },
        completion = {
          file_sources = {
            enabled = true,
            preferred_cli_tool = "server", -- 'fd','fdfind','rg','git','server' if nil, it will use the best available tool, 'server' uses opencode cli to get file list (works cross platform) and supports folders
            ignore_patterns = {
              "^%.git/",
              "^%.svn/",
              "^%.hg/",
              "node_modules/",
              "%.pyc$",
              "%.o$",
              "%.obj$",
              "%.exe$",
              "%.dll$",
              "%.so$",
              "%.dylib$",
              "%.class$",
              "%.jar$",
              "%.war$",
              "%.ear$",
              "target/",
              "build/",
              "dist/",
              "out/",
              "deps/",
              "%.tmp$",
              "%.temp$",
              "%.log$",
              "%.cache$",
            },
            max_files = 10,
            max_display_length = 50, -- Maximum length for file path display in completion, truncates from left with "..."
          },
        },
      },
      context = {
        enabled = true, -- Enable automatic context capturing
        cursor_data = {
          enabled = false, -- Include cursor position and line content in the context
          context_lines = 5, -- Number of lines before and after cursor to include in context
        },
        diagnostics = {
          info = false, -- Include diagnostics info in the context (default to false
          warn = true, -- Include diagnostics warnings in the context
          error = true, -- Include diagnostics errors in the context
          only_closest = false, -- If true, only diagnostics for cursor/selection
        },
        current_file = {
          enabled = true, -- Include current file path and content in the context
          show_full_path = true,
        },
        files = {
          enabled = true,
          show_full_path = true,
        },
        selection = {
          enabled = true, -- Include selected text in the context
        },
        buffer = {
          enabled = false, -- Disable entire buffer context by default, only used in quick chat
        },
        git_diff = {
          enabled = false,
        },
      },
      debug = {
        enabled = false, -- Enable debug messages in the output window
        capture_streamed_events = false,
        show_ids = true,
        quick_chat = {
          keep_session = false, -- Keep quick_chat sessions for inspection, this can pollute your sessions list
          set_active_session = false,
        },
      },
      prompt_guard = nil, -- Optional function that returns boolean to control when prompts can be sent (see Prompt Guard section)

      -- User Hooks for custom behavior at certain events
      hooks = {
        on_file_edited = nil, -- Called after a file is edited by opencode.
        on_session_loaded = nil, -- Called after a session is loaded.
        on_done_thinking = nil, -- Called when opencode finishes thinking (all jobs complete).
        on_permission_requested = nil, -- Called when a permission request is issued.
      },
      quick_chat = {
        default_model = nil, -- works better with a fast model like gpt-4.1
        default_agent = "plan", -- plan ensure no file modifications by default
        instructions = nil, -- Use built-in instructions if nil
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
    },
    -- Optional, for file mentions picker, pick only one
    "folke/snacks.nvim",
  },
}
