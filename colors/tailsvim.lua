vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "tailsvim"
vim.o.termguicolors = true

local p = {
  -- Tailwind Gray scale (backgrounds/UI) - exact hex values
  gray_50 = "#f9fafb",
  gray_100 = "#f3f4f6",
  gray_200 = "#e5e7eb",
  gray_300 = "#d1d5db",
  gray_400 = "#9ca3af",
  gray_500 = "#6b7280",
  gray_600 = "#4b5563",
  gray_700 = "#374151",
  gray_800 = "#1f2937",
  gray_900 = "#111827",
  gray_950 = "#030712",

  -- Tailwind Teal - exact hex values
  teal_50 = "#f0fdfa",
  teal_100 = "#ccfbf1",
  teal_200 = "#99f6e4",
  teal_300 = "#5eead4",
  teal_400 = "#2dd4bf",
  teal_500 = "#14b8a6",
  teal_600 = "#0d9488",
  teal_700 = "#0f766e",
  teal_800 = "#115e59",
  teal_900 = "#134e4a",
  teal_950 = "#042f2e",

  -- Tailwind Emerald - exact hex values
  emerald_50 = "#ecfdf5",
  emerald_100 = "#d1fae5",
  emerald_200 = "#a7f3d0",
  emerald_300 = "#6ee7b7",
  emerald_400 = "#34d399",
  emerald_500 = "#10b981",
  emerald_600 = "#059669",
  emerald_700 = "#047857",
  emerald_800 = "#065f46",
  emerald_900 = "#064e3b",
  emerald_950 = "#022c22",

  -- Tailwind Fuchsia - exact hex values
  fuchsia_50 = "#fdf4ff",
  fuchsia_100 = "#fae8ff",
  fuchsia_200 = "#f5d0fe",
  fuchsia_300 = "#f0abfc",
  fuchsia_400 = "#e879f9",
  fuchsia_500 = "#d946ef",
  fuchsia_600 = "#c026d3",
  fuchsia_700 = "#a21caf",
  fuchsia_800 = "#86198f",
  fuchsia_900 = "#701a75",
  fuchsia_950 = "#4a044e",

  -- Additional colors
  red_400 = "#f87171",
  red_500 = "#ef4444",
  red_600 = "#dc2626",
  yellow_400 = "#facc15",
  yellow_500 = "#eab308",
  orange_500 = "#f97316",
  cyan_400 = "#22d3ee",
  cyan_500 = "#06b6d4",
  blue_500 = "#3b82f6",
  blue_600 = "#2563eb",
  pink_500 = "#ec4899",

  black = "#000000",
  white = "#ffffff",
  none = "NONE",
}

-- --- TERMINAL COLORS ---
vim.g.terminal_color_0 = p.gray_800
vim.g.terminal_color_1 = p.red_500
vim.g.terminal_color_2 = p.emerald_500
vim.g.terminal_color_3 = p.yellow_500
vim.g.terminal_color_4 = p.blue_500
vim.g.terminal_color_5 = p.fuchsia_500
vim.g.terminal_color_6 = p.teal_500
vim.g.terminal_color_7 = p.gray_100
vim.g.terminal_color_8 = p.gray_500
vim.g.terminal_color_9 = p.red_500
vim.g.terminal_color_10 = p.emerald_500
vim.g.terminal_color_11 = p.yellow_500
vim.g.terminal_color_12 = p.blue_500
vim.g.terminal_color_13 = p.fuchsia_500
vim.g.terminal_color_14 = p.teal_500
vim.g.terminal_color_15 = p.gray_50

local hl = vim.api.nvim_set_hl

-- =============================================================================
-- 1. EDITOR CORE UI
-- =============================================================================
hl(0, "Normal", { fg = p.gray_100, bg = p.gray_950 })
hl(0, "NormalNC", { fg = p.gray_100, bg = p.gray_950 })
hl(0, "NormalFloat", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "FloatBorder", { fg = p.teal_500, bg = p.gray_900 })
hl(0, "FloatTitle", { fg = p.gray_950, bg = p.teal_500, bold = true })
hl(0, "Cursor", { bg = p.gray_100, fg = p.gray_950 })
hl(0, "lCursor", { link = "Cursor" })
hl(0, "CursorIM", { link = "Cursor" })
hl(0, "TermCursor", { bg = p.gray_100, fg = p.gray_950 })
hl(0, "TermCursorNC", { bg = p.gray_500, fg = p.gray_950 })
hl(0, "CursorLine", { bg = p.gray_900 })
hl(0, "CursorColumn", { bg = p.gray_900 })
hl(0, "ColorColumn", { bg = p.gray_900 })
hl(0, "LineNr", { fg = p.gray_600 })
hl(0, "CursorLineNr", { fg = p.teal_400, bold = true })
hl(0, "CursorLineFold", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "CursorLineSign", { fg = p.teal_400, bg = p.gray_900 })
hl(0, "SignColumn", { bg = p.gray_950 })
hl(0, "FoldColumn", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "VertSplit", { fg = p.gray_800, bg = p.gray_950 })
hl(0, "WinSeparator", { fg = p.gray_800, bg = p.gray_950 })
hl(0, "WinBar", { fg = p.teal_400, bg = p.gray_950, bold = true })
hl(0, "WinBarNC", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "Visual", { bg = p.gray_800 })
hl(0, "VisualNOS", { bg = p.gray_800 })
hl(0, "Search", { bg = p.fuchsia_600, fg = p.gray_50, bold = true })
hl(0, "IncSearch", { bg = p.yellow_500, fg = p.gray_950, bold = true })
hl(0, "CurSearch", { bg = p.orange_500, fg = p.gray_950, bold = true })
hl(0, "Substitute", { bg = p.red_500, fg = p.gray_950 })
hl(0, "Question", { fg = p.emerald_400, bold = true })
hl(0, "QuickFixLine", { bg = p.gray_800, bold = true })
hl(0, "StatusLine", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "StatusLineNC", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "TabLine", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "TabLineFill", { bg = p.gray_950 })
hl(0, "TabLineSel", { fg = p.gray_50, bg = p.gray_900, bold = true })
hl(0, "Title", { fg = p.fuchsia_400, bold = true })
hl(0, "Directory", { fg = p.blue_500 })
hl(0, "EndOfBuffer", { fg = p.gray_950 })
hl(0, "Conceal", { fg = p.gray_500 })
hl(0, "NonText", { fg = p.gray_700 })
hl(0, "SpecialKey", { fg = p.gray_700 })
hl(0, "Whitespace", { fg = p.gray_700 })

-- Popup Menus
hl(0, "Pmenu", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "PmenuSel", { bg = p.teal_600, fg = p.gray_50, bold = true })
hl(0, "PmenuSbar", { bg = p.gray_800 })
hl(0, "PmenuThumb", { bg = p.gray_600 })
hl(0, "PmenuKind", { bg = p.gray_800, fg = p.cyan_400 })
hl(0, "PmenuKindSel", { bg = p.teal_600, fg = p.gray_50, bold = true })
hl(0, "PmenuExtra", { bg = p.gray_800, fg = p.gray_500 })
hl(0, "PmenuExtraSel", { bg = p.teal_600, fg = p.gray_50 })
hl(0, "WildMenu", { bg = p.teal_600, fg = p.gray_50, bold = true })

-- Matching & Folding
hl(0, "MatchParen", { fg = p.emerald_300, bold = true, underline = true })
hl(0, "Folded", { bg = p.gray_900, fg = p.gray_500, italic = true })

-- Messages & Modes
hl(0, "ModeMsg", { fg = p.emerald_400, bold = true })
hl(0, "MoreMsg", { fg = p.cyan_400, bold = true })
hl(0, "WarningMsg", { fg = p.yellow_400, bold = true })
hl(0, "ErrorMsg", { fg = p.red_500, bold = true })
hl(0, "MsgArea", { fg = p.gray_100, bg = p.gray_950 })
hl(0, "MsgSeparator", { fg = p.gray_800, bg = p.gray_950 })

-- Spelling
hl(0, "SpellBad", { undercurl = true, sp = p.red_500 })
hl(0, "SpellCap", { undercurl = true, sp = p.yellow_500 })
hl(0, "SpellLocal", { undercurl = true, sp = p.cyan_400 })
hl(0, "SpellRare", { undercurl = true, sp = p.fuchsia_500 })

-- Diff Mode
hl(0, "DiffAdd", { bg = p.emerald_600, fg = p.gray_50 })
hl(0, "DiffChange", { bg = p.yellow_500, fg = p.gray_950 })
hl(0, "DiffDelete", { bg = p.red_600, fg = p.gray_50 })
hl(0, "DiffText", { bg = p.orange_500, fg = p.gray_950, bold = true })
hl(0, "diffAdded", { fg = p.emerald_400 })
hl(0, "diffRemoved", { fg = p.red_500 })
hl(0, "diffChanged", { fg = p.yellow_400 })
hl(0, "diffOldFile", { fg = p.red_500 })
hl(0, "diffNewFile", { fg = p.emerald_400 })
hl(0, "diffFile", { fg = p.cyan_400 })
hl(0, "diffLine", { fg = p.gray_500 })
hl(0, "diffIndexLine", { fg = p.fuchsia_400 })

-- =============================================================================
-- 2. SYNTAX HIGHLIGHTING (Standard & Treesitter)
-- =============================================================================

-- Standard Vim Syntax
hl(0, "Comment", { fg = p.gray_500, italic = true })
hl(0, "Constant", { fg = p.orange_500 })
hl(0, "String", { fg = p.emerald_400 })
hl(0, "Character", { fg = p.emerald_300 })
hl(0, "Number", { fg = p.orange_500 })
hl(0, "Boolean", { fg = p.orange_500, bold = true })
hl(0, "Float", { fg = p.orange_500 })
hl(0, "Identifier", { fg = p.gray_100 })
hl(0, "Function", { fg = p.blue_500 })
hl(0, "Statement", { fg = p.fuchsia_400 })
hl(0, "Conditional", { fg = p.fuchsia_400, italic = true })
hl(0, "Repeat", { fg = p.fuchsia_400, italic = true })
hl(0, "Label", { fg = p.fuchsia_400 })
hl(0, "Operator", { fg = p.teal_400 })
hl(0, "Keyword", { fg = p.fuchsia_400, bold = true })
hl(0, "Exception", { fg = p.red_500, bold = true })
hl(0, "PreProc", { fg = p.yellow_400 })
hl(0, "Include", { fg = p.fuchsia_400 })
hl(0, "Define", { fg = p.fuchsia_400 })
hl(0, "Macro", { fg = p.teal_500 })
hl(0, "PreCondit", { fg = p.fuchsia_400 })
hl(0, "Type", { fg = p.cyan_400 })
hl(0, "StorageClass", { fg = p.fuchsia_400 })
hl(0, "Structure", { fg = p.cyan_400 })
hl(0, "Typedef", { fg = p.cyan_400 })
hl(0, "Special", { fg = p.teal_400 })
hl(0, "SpecialChar", { fg = p.emerald_300 })
hl(0, "Tag", { fg = p.fuchsia_400 })
hl(0, "Delimiter", { fg = p.gray_300 })
hl(0, "SpecialComment", { fg = p.cyan_400, italic = true })
hl(0, "Debug", { fg = p.red_500 })
hl(0, "Underlined", { underline = true })
hl(0, "Ignore", { fg = p.gray_600 })
hl(0, "Error", { fg = p.red_500, bold = true })
hl(0, "Todo", { fg = p.gray_950, bg = p.yellow_400, bold = true })

-- Treesitter Core
hl(0, "@variable", { fg = p.gray_100 })
hl(0, "@variable.builtin", { fg = p.red_500 })
hl(0, "@variable.parameter", { fg = p.orange_500 })
hl(0, "@variable.parameter.builtin", { fg = p.red_500 })
hl(0, "@variable.member", { fg = p.teal_300 })
hl(0, "@constant", { fg = p.orange_500 })
hl(0, "@constant.builtin", { fg = p.orange_500, bold = true })
hl(0, "@constant.macro", { fg = p.teal_500 })
hl(0, "@module", { fg = p.cyan_400 })
hl(0, "@module.builtin", { fg = p.cyan_400, bold = true })
hl(0, "@label", { fg = p.fuchsia_400 })
hl(0, "@string.special", { fg = p.emerald_300 })
hl(0, "@string.special.url", { fg = p.cyan_500, underline = true })
hl(0, "@string.special.path", { fg = p.emerald_400 })
hl(0, "@string.special.symbol", { fg = p.teal_400 })

-- Treesitter Functions & Methods
hl(0, "@function", { fg = p.blue_500 })
hl(0, "@function.builtin", { fg = p.blue_600 })
hl(0, "@function.call", { fg = p.blue_500 })
hl(0, "@function.macro", { fg = p.teal_500 })
hl(0, "@function.method", { fg = p.blue_500 })
hl(0, "@function.method.call", { fg = p.blue_500 })
hl(0, "@constructor", { fg = p.cyan_400 })
hl(0, "@parameter", { fg = p.orange_500 })
hl(0, "@method", { fg = p.blue_500 })
hl(0, "@method.call", { fg = p.blue_500 })

-- Treesitter Keywords
hl(0, "@keyword", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.function", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.operator", { fg = p.fuchsia_400 })
hl(0, "@keyword.import", { fg = p.fuchsia_400 })
hl(0, "@keyword.return", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.conditional", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.repeat", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.exception", { fg = p.red_500, bold = true })
hl(0, "@keyword.storage", { fg = p.fuchsia_400 })

-- Treesitter Strings & Characters
hl(0, "@string", { fg = p.emerald_400 })
hl(0, "@string.documentation", { fg = p.emerald_500, italic = true })
hl(0, "@string.regexp", { fg = p.emerald_300 })
hl(0, "@string.escape", { fg = p.emerald_300 })
hl(0, "@string.special", { fg = p.emerald_300 })
hl(0, "@string.special.symbol", { fg = p.teal_400 })
hl(0, "@string.special.url", { fg = p.cyan_500, underline = true })
hl(0, "@string.special.path", { fg = p.emerald_400 })
hl(0, "@character", { fg = p.emerald_300 })
hl(0, "@character.special", { fg = p.emerald_300 })

-- Treesitter Types
hl(0, "@type", { fg = p.cyan_400 })
hl(0, "@type.builtin", { fg = p.cyan_400, italic = true })
hl(0, "@type.definition", { fg = p.cyan_400 })
hl(0, "@type.qualifier", { fg = p.fuchsia_400 })
hl(0, "@attribute", { fg = p.teal_400 })
hl(0, "@property", { fg = p.teal_300 })
hl(0, "@field", { fg = p.teal_300 })
hl(0, "@class", { fg = p.cyan_400 })
hl(0, "@struct", { fg = p.cyan_400 })
hl(0, "@enum", { fg = p.cyan_400 })
hl(0, "@interface", { fg = p.cyan_400 })
hl(0, "@union", { fg = p.cyan_400 })

-- Treesitter Operators & Punctuation
hl(0, "@operator", { fg = p.teal_400 })
hl(0, "@punctuation.delimiter", { fg = p.gray_300 })
hl(0, "@punctuation.bracket", { fg = p.gray_300 })
hl(0, "@punctuation.special", { fg = p.teal_400 })

-- Treesitter Comments
hl(0, "@comment", { fg = p.gray_500, italic = true })
hl(0, "@comment.documentation", { fg = p.gray_500, italic = true })
hl(0, "@comment.error", { fg = p.red_500, bg = p.gray_900 })
hl(0, "@comment.warning", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "@comment.todo", { fg = p.gray_950, bg = p.yellow_400, bold = true })
hl(0, "@comment.note", { fg = p.cyan_400, bg = p.gray_900 })

-- Treesitter Tags (HTML/JSX/XML)
hl(0, "@tag", { fg = p.fuchsia_400 })
hl(0, "@tag.builtin", { fg = p.fuchsia_400, bold = true })
hl(0, "@tag.attribute", { fg = p.teal_300 })
hl(0, "@tag.delimiter", { fg = p.gray_300 })

-- Treesitter Markup (Markdown)
hl(0, "@markup.strong", { bold = true })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.strikethrough", { strikethrough = true })
hl(0, "@markup.underline", { underline = true })
hl(0, "@markup.heading", { fg = p.fuchsia_400, bold = true })
hl(0, "@markup.heading.1", { fg = p.fuchsia_400, bold = true })
hl(0, "@markup.heading.2", { fg = p.blue_500, bold = true })
hl(0, "@markup.heading.3", { fg = p.teal_400, bold = true })
hl(0, "@markup.heading.4", { fg = p.emerald_400, bold = true })
hl(0, "@markup.heading.5", { fg = p.yellow_400, bold = true })
hl(0, "@markup.heading.6", { fg = p.orange_500, bold = true })
hl(0, "@markup.quote", { fg = p.gray_500, italic = true })
hl(0, "@markup.math", { fg = p.orange_500 })
hl(0, "@markup.environment", { fg = p.fuchsia_400 })
hl(0, "@markup.link", { fg = p.teal_400, underline = true })
hl(0, "@markup.link.label", { fg = p.teal_400 })
hl(0, "@markup.link.url", { fg = p.cyan_500, underline = true })
hl(0, "@markup.raw", { fg = p.emerald_400 })
hl(0, "@markup.raw.block", { fg = p.emerald_400 })
hl(0, "@markup.list", { fg = p.fuchsia_400 })
hl(0, "@markup.list.checked", { fg = p.emerald_400 })
hl(0, "@markup.list.unchecked", { fg = p.gray_500 })

-- Treesitter Numbers & Booleans
hl(0, "@number", { fg = p.orange_500 })
hl(0, "@number.float", { fg = p.orange_500 })
hl(0, "@boolean", { fg = p.orange_500, bold = true })

-- Treesitter Diffs
hl(0, "@diff.plus", { fg = p.emerald_400 })
hl(0, "@diff.minus", { fg = p.red_500 })
hl(0, "@diff.delta", { fg = p.yellow_400 })

-- Language-Specific (Lua)
hl(0, "@variable.builtin.lua", { fg = p.red_500 })
hl(0, "@function.call.lua", { fg = p.blue_500 })
hl(0, "@operator.lua", { fg = p.teal_400 })
hl(0, "@lsp.type.namespace.lua", { fg = p.cyan_400 })
hl(0, "@lsp.type.property.lua", { fg = p.teal_300 })

-- Language-Specific (Python)
hl(0, "@variable.builtin.python", { fg = p.red_500, italic = true })
hl(0, "@function.call.python", { fg = p.blue_500 })
hl(0, "@attribute.python", { fg = p.teal_400 })
hl(0, "@keyword.return.python", { fg = p.fuchsia_400, italic = true })
hl(0, "@lsp.type.decorator.python", { fg = p.cyan_400 })
hl(0, "@lsp.type.parameter.python", { fg = p.orange_500 })
hl(0, "@keyword.function.python", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.import.python", { fg = p.fuchsia_400 })
hl(0, "@keyword.conditional.python", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.repeat.python", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.exception.python", { fg = p.red_500, bold = true })

-- Language-Specific (JavaScript/TypeScript)
hl(0, "@variable.builtin.javascript", { fg = p.red_500 })
hl(0, "@variable.builtin.typescript", { fg = p.red_500 })
hl(0, "@function.call.javascript", { fg = p.blue_500 })
hl(0, "@function.call.typescript", { fg = p.blue_500 })
hl(0, "@lsp.type.property.javascript", { fg = p.teal_300 })
hl(0, "@lsp.type.property.typescript", { fg = p.teal_300 })
hl(0, "@lsp.type.variable.javascript", { fg = p.gray_100 })
hl(0, "@lsp.type.variable.typescript", { fg = p.gray_100 })
hl(0, "@lsp.type.decorator.javascript", { fg = p.teal_500 })
hl(0, "@lsp.type.decorator.typescript", { fg = p.teal_500 })
hl(0, "@lsp.type.interface.javascript", { fg = p.cyan_400 })
hl(0, "@lsp.type.interface.typescript", { fg = p.cyan_400 })
hl(0, "@lsp.type.typeParameter.javascript", { fg = p.cyan_400 })
hl(0, "@lsp.type.typeParameter.typescript", { fg = p.cyan_400 })
hl(0, "@lsp.mod.declaration.javascript", { bold = true })
hl(0, "@lsp.mod.declaration.typescript", { bold = true })
hl(0, "@lsp.mod.readonly.javascript", { italic = true })
hl(0, "@lsp.mod.readonly.typescript", { italic = true })
hl(0, "@keyword.function.javascript", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.function.typescript", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.import.javascript", { fg = p.fuchsia_400 })
hl(0, "@keyword.import.typescript", { fg = p.fuchsia_400 })

-- Language-Specific (Rust)
hl(0, "@variable.builtin.rust", { fg = p.red_500 })
hl(0, "@function.call.rust", { fg = p.blue_500 })
hl(0, "@lsp.type.namespace.rust", { fg = p.cyan_400 })
hl(0, "@lsp.type.property.rust", { fg = p.teal_300 })
hl(0, "@lsp.type.typeParameter.rust", { fg = p.cyan_400 })
hl(0, "@lsp.type.lifetime.rust", { fg = p.fuchsia_400, italic = true })
hl(0, "@keyword.function.rust", { fg = p.fuchsia_400, bold = true })
hl(0, "@attribute.rust", { fg = p.teal_400 })
hl(0, "@operator.rust", { fg = p.teal_400 })
hl(0, "@keyword.crate.rust", { fg = p.fuchsia_400 })
hl(0, "@keyword.unsafe.rust", { fg = p.red_500, bold = true })

-- Language-Specific (Go)
hl(0, "@variable.builtin.go", { fg = p.red_500 })
hl(0, "@function.call.go", { fg = p.blue_500 })
hl(0, "@lsp.type.namespace.go", { fg = p.cyan_400 })
hl(0, "@lsp.type.property.go", { fg = p.teal_300 })
hl(0, "@lsp.type.interface.go", { fg = p.cyan_400 })
hl(0, "@lsp.type.struct.go", { fg = p.cyan_400 })
hl(0, "@keyword.function.go", { fg = p.fuchsia_400, bold = true })
hl(0, "@attribute.go", { fg = p.teal_400 })
hl(0, "@operator.go", { fg = p.teal_400 })
hl(0, "@lsp.type.field.go", { fg = p.teal_300 })
hl(0, "@keyword.import.go", { fg = p.fuchsia_400 })

-- Language-Specific (C/C++)
hl(0, "@variable.builtin.c", { fg = p.red_500 })
hl(0, "@variable.builtin.cpp", { fg = p.red_500 })
hl(0, "@function.call.c", { fg = p.blue_500 })
hl(0, "@function.call.cpp", { fg = p.blue_500 })
hl(0, "@lsp.type.namespace.c", { fg = p.cyan_400 })
hl(0, "@lsp.type.namespace.cpp", { fg = p.cyan_400 })
hl(0, "@lsp.type.macro.c", { fg = p.teal_500 })
hl(0, "@lsp.type.macro.cpp", { fg = p.teal_500 })
hl(0, "@lsp.type.struct.c", { fg = p.cyan_400 })
hl(0, "@lsp.type.struct.cpp", { fg = p.cyan_400 })
hl(0, "@lsp.type.class.cpp", { fg = p.cyan_400 })
hl(0, "@lsp.type.enum.c", { fg = p.cyan_400 })
hl(0, "@lsp.type.enum.cpp", { fg = p.cyan_400 })
hl(0, "@keyword.directive.c", { fg = p.teal_500 })
hl(0, "@keyword.directive.cpp", { fg = p.teal_500 })
hl(0, "@keyword.directive.define.c", { fg = p.fuchsia_400 })
hl(0, "@keyword.directive.define.cpp", { fg = p.fuchsia_400 })
hl(0, "@operator.c", { fg = p.teal_400 })
hl(0, "@operator.cpp", { fg = p.teal_400 })
hl(0, "@lsp.mod.reference.c", { italic = true })
hl(0, "@lsp.mod.reference.cpp", { italic = true })

-- Language-Specific (Bash/Shell)
hl(0, "@variable.builtin.bash", { fg = p.red_500 })
hl(0, "@variable.builtin.sh", { fg = p.red_500 })
hl(0, "@keyword.function.bash", { fg = p.fuchsia_400, bold = true })
hl(0, "@keyword.function.sh", { fg = p.fuchsia_400, bold = true })
hl(0, "@function.call.bash", { fg = p.blue_500 })
hl(0, "@function.call.sh", { fg = p.blue_500 })
hl(0, "@operator.bash", { fg = p.teal_400 })
hl(0, "@operator.sh", { fg = p.teal_400 })
hl(0, "@punctuation.special.bash", { fg = p.fuchsia_400 })
hl(0, "@punctuation.special.sh", { fg = p.fuchsia_400 })
hl(0, "@string.special.bash", { fg = p.emerald_300 })
hl(0, "@string.special.sh", { fg = p.emerald_300 })

-- Language-Specific (PowerShell)
hl(0, "@variable.builtin.powershell", { fg = p.red_500 })
hl(0, "@keyword.function.powershell", { fg = p.fuchsia_400, bold = true })
hl(0, "@function.call.powershell", { fg = p.blue_500 })
hl(0, "@operator.powershell", { fg = p.teal_400 })
hl(0, "@lsp.type.variable.powershell", { fg = p.gray_100 })
hl(0, "@lsp.type.property.powershell", { fg = p.teal_300 })
hl(0, "@lsp.type.namespace.powershell", { fg = p.cyan_400 })

-- Language-Specific (TOML)
hl(0, "@variable.builtin.toml", { fg = p.red_500 })
hl(0, "@property.toml", { fg = p.teal_300 })
hl(0, "@lsp.type.property.toml", { fg = p.teal_300 })
hl(0, "@lsp.type.key.toml", { fg = p.fuchsia_400 })
hl(0, "@label.toml", { fg = p.fuchsia_400 })
hl(0, "@string.toml", { fg = p.emerald_400 })
hl(0, "@string.special.toml", { fg = p.emerald_300 })

-- Language-Specific (JSON)
hl(0, "@variable.builtin.json", { fg = p.red_500 })
hl(0, "@property.json", { fg = p.teal_300 })
hl(0, "@lsp.type.property.json", { fg = p.teal_300 })
hl(0, "@lsp.type.key.json", { fg = p.fuchsia_400 })
hl(0, "@label.json", { fg = p.fuchsia_400 })
hl(0, "@string.json", { fg = p.emerald_400 })
hl(0, "@number.json", { fg = p.orange_500 })
hl(0, "@boolean.json", { fg = p.orange_500, bold = true })

-- Language-Specific (HTML)
hl(0, "@tag.attribute.html", { fg = p.teal_300 })
hl(0, "@tag.delimiter.html", { fg = p.gray_300 })
hl(0, "@string.special.html", { fg = p.emerald_300 })

-- Language-Specific (CSS/SCSS)
hl(0, "@property.css", { fg = p.teal_300 })
hl(0, "@tag.attribute.css", { fg = p.teal_300 })
hl(0, "@lsp.type.property.css", { fg = p.teal_300 })
hl(0, "@lsp.type.property.scss", { fg = p.teal_300 })
hl(0, "@keyword.css", { fg = p.fuchsia_400 })
hl(0, "@keyword.scss", { fg = p.fuchsia_400 })

-- =============================================================================
-- 3. LSP & DIAGNOSTICS
-- =============================================================================

-- LSP References
hl(0, "LspReferenceText", { bg = p.gray_800 })
hl(0, "LspReferenceRead", { bg = p.gray_800 })
hl(0, "LspReferenceWrite", { bg = p.gray_800, underline = true })
hl(0, "LspSignatureActiveParameter", { fg = p.orange_500, bold = true })
hl(0, "LspCodeLens", { fg = p.gray_500, italic = true })
hl(0, "LspCodeLensSeparator", { fg = p.gray_600 })
hl(0, "LspInlayHint", { fg = p.gray_500, bg = p.gray_900, italic = true })

-- Diagnostics
hl(0, "DiagnosticError", { fg = p.red_500 })
hl(0, "DiagnosticWarn", { fg = p.yellow_400 })
hl(0, "DiagnosticInfo", { fg = p.cyan_400 })
hl(0, "DiagnosticHint", { fg = p.teal_400 })
hl(0, "DiagnosticOk", { fg = p.emerald_400 })

hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.red_500 })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow_400 })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.cyan_400 })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.teal_400 })
hl(0, "DiagnosticUnderlineOk", { undercurl = true, sp = p.emerald_400 })

hl(0, "DiagnosticVirtualTextError", { fg = p.red_500, bg = p.gray_900 })
hl(0, "DiagnosticVirtualTextWarn", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "DiagnosticVirtualTextInfo", { fg = p.cyan_400, bg = p.gray_900 })
hl(0, "DiagnosticVirtualTextHint", { fg = p.teal_400, bg = p.gray_900 })
hl(0, "DiagnosticVirtualTextOk", { fg = p.emerald_400, bg = p.gray_900 })

hl(0, "DiagnosticFloatingError", { fg = p.red_500, bg = p.gray_900 })
hl(0, "DiagnosticFloatingWarn", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "DiagnosticFloatingInfo", { fg = p.cyan_400, bg = p.gray_900 })
hl(0, "DiagnosticFloatingHint", { fg = p.teal_400, bg = p.gray_900 })
hl(0, "DiagnosticFloatingOk", { fg = p.emerald_400, bg = p.gray_900 })

hl(0, "DiagnosticSignError", { fg = p.red_500, bg = p.gray_950 })
hl(0, "DiagnosticSignWarn", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "DiagnosticSignInfo", { fg = p.cyan_400, bg = p.gray_950 })
hl(0, "DiagnosticSignHint", { fg = p.teal_400, bg = p.gray_950 })
hl(0, "DiagnosticSignOk", { fg = p.emerald_400, bg = p.gray_950 })

-- LSP Semantic Tokens
hl(0, "@lsp.type.class", { link = "@type" })
hl(0, "@lsp.type.decorator", { link = "@function" })
hl(0, "@lsp.type.enum", { link = "@type" })
hl(0, "@lsp.type.enumMember", { link = "@constant" })
hl(0, "@lsp.type.function", { link = "@function" })
hl(0, "@lsp.type.interface", { link = "@type" })
hl(0, "@lsp.type.macro", { link = "@macro" })
hl(0, "@lsp.type.method", { link = "@function.method" })
hl(0, "@lsp.type.namespace", { link = "@module" })
hl(0, "@lsp.type.parameter", { link = "@parameter" })
hl(0, "@lsp.type.property", { link = "@property" })
hl(0, "@lsp.type.struct", { link = "@type" })
hl(0, "@lsp.type.type", { link = "@type" })
hl(0, "@lsp.type.typeParameter", { link = "@type" })
hl(0, "@lsp.type.variable", { link = "@variable" })

-- =============================================================================
-- 4. LAZYVIM PLUGINS
-- =============================================================================

-- Lazy.nvim
hl(0, "LazyNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "LazyH1", { bg = p.teal_500, fg = p.gray_950, bold = true })
hl(0, "LazyH2", { fg = p.teal_400, bold = true })
hl(0, "LazyButton", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "LazyButtonActive", { bg = p.teal_600, fg = p.gray_50, bold = true })
hl(0, "LazyComment", { fg = p.gray_500, italic = true })
hl(0, "LazyCommit", { fg = p.emerald_400 })
hl(0, "LazyCommitIssue", { fg = p.red_500 })
hl(0, "LazyCommitType", { fg = p.fuchsia_400 })
hl(0, "LazyCommitScope", { fg = p.cyan_400 })
hl(0, "LazyDimmed", { fg = p.gray_500 })
hl(0, "LazyDir", { fg = p.cyan_400 })
hl(0, "LazyLocal", { fg = p.teal_400 })
hl(0, "LazyProp", { fg = p.teal_300 })
hl(0, "LazyReasonCmd", { fg = p.yellow_400 })
hl(0, "LazyReasonEvent", { fg = p.orange_500 })
hl(0, "LazyReasonFt", { fg = p.fuchsia_400 })
hl(0, "LazyReasonImport", { fg = p.cyan_400 })
hl(0, "LazyReasonKeys", { fg = p.blue_500 })
hl(0, "LazyReasonPlugin", { fg = p.emerald_400 })
hl(0, "LazyReasonRuntime", { fg = p.cyan_500 })
hl(0, "LazyReasonSource", { fg = p.teal_400 })
hl(0, "LazyReasonStart", { fg = p.emerald_300 })
hl(0, "LazySpecial", { fg = p.teal_400 })
hl(0, "LazyTaskError", { fg = p.red_500 })
hl(0, "LazyTaskOutput", { fg = p.gray_100 })
hl(0, "LazyUrl", { fg = p.cyan_500, underline = true })
hl(0, "LazyValue", { fg = p.teal_300 })

-- Mason
hl(0, "MasonNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "MasonHeader", { bg = p.teal_500, fg = p.gray_950, bold = true })
hl(0, "MasonHeaderSecondary", { bg = p.cyan_400, fg = p.gray_950, bold = true })
hl(0, "MasonHighlight", { fg = p.teal_400 })
hl(0, "MasonHighlightBlock", { bg = p.teal_600, fg = p.gray_50 })
hl(0, "MasonHighlightBlockBold", { bg = p.teal_600, fg = p.gray_50, bold = true })
hl(0, "MasonHighlightSecondary", { fg = p.cyan_400 })
hl(0, "MasonHighlightBlockSecondary", { bg = p.cyan_400, fg = p.gray_950 })
hl(0, "MasonHighlightBlockBoldSecondary", { bg = p.cyan_400, fg = p.gray_950, bold = true })
hl(0, "MasonMuted", { fg = p.gray_500 })
hl(0, "MasonMutedBlock", { bg = p.gray_800, fg = p.gray_500 })
hl(0, "MasonMutedBlockBold", { bg = p.gray_800, fg = p.gray_500, bold = true })
hl(0, "MasonError", { fg = p.red_500 })
hl(0, "MasonWarning", { fg = p.yellow_400 })
hl(0, "MasonHeading", { fg = p.teal_400, bold = true })

-- Telescope
hl(0, "TelescopeNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "TelescopeBorder", { bg = p.gray_900, fg = p.gray_800 })
hl(0, "TelescopeTitle", { fg = p.gray_950, bg = p.teal_500, bold = true })
hl(0, "TelescopePromptNormal", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "TelescopePromptBorder", { bg = p.gray_800, fg = p.gray_800 })
hl(0, "TelescopePromptTitle", { bg = p.teal_500, fg = p.gray_950, bold = true })
hl(0, "TelescopePromptPrefix", { fg = p.teal_400, bg = p.gray_800 })
hl(0, "TelescopePromptCounter", { fg = p.gray_500, bg = p.gray_800 })
hl(0, "TelescopePreviewNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "TelescopePreviewBorder", { bg = p.gray_900, fg = p.gray_900 })
hl(0, "TelescopePreviewTitle", { bg = p.emerald_500, fg = p.gray_950, bold = true })
hl(0, "TelescopeResultsNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "TelescopeResultsBorder", { bg = p.gray_900, fg = p.gray_900 })
hl(0, "TelescopeResultsTitle", { bg = p.cyan_400, fg = p.gray_950, bold = true })
hl(0, "TelescopeSelection", { bg = p.gray_800, fg = p.gray_50, bold = true })
hl(0, "TelescopeSelectionCaret", { fg = p.fuchsia_400, bg = p.gray_800 })
hl(0, "TelescopeMultiSelection", { fg = p.cyan_400, bg = p.gray_800 })
hl(0, "TelescopeMatching", { fg = p.emerald_300, bold = true })
hl(0, "TelescopePreviewLine", { bg = p.gray_800 })
hl(0, "TelescopePreviewMatch", { bg = p.teal_600, fg = p.gray_50 })

-- NvimTree
hl(0, "NvimTreeNormal", { bg = p.gray_900, fg = p.gray_200 })
hl(0, "NvimTreeNormalNC", { bg = p.gray_900, fg = p.gray_200 })
hl(0, "NvimTreeWinSeparator", { fg = p.gray_950, bg = p.gray_950 })
hl(0, "NvimTreeEndOfBuffer", { fg = p.gray_900, bg = p.gray_900 })
hl(0, "NvimTreeRootFolder", { fg = p.fuchsia_400, bold = true })
hl(0, "NvimTreeFolderName", { fg = p.blue_500 })
hl(0, "NvimTreeFolderIcon", { fg = p.blue_500 })
hl(0, "NvimTreeEmptyFolderName", { fg = p.blue_500 })
hl(0, "NvimTreeOpenedFolderName", { fg = p.teal_400, bold = true })
hl(0, "NvimTreeFileName", { fg = p.gray_200 })
hl(0, "NvimTreeFileIcon", { fg = p.gray_100 })
hl(0, "NvimTreeOpenedFile", { fg = p.teal_400, bold = true })
hl(0, "NvimTreeIndentMarker", { fg = p.gray_600 })
hl(0, "NvimTreeGitAdded", { fg = p.emerald_400 })
hl(0, "NvimTreeGitConflict", { fg = p.red_500, bold = true })
hl(0, "NvimTreeGitDeleted", { fg = p.red_500 })
hl(0, "NvimTreeGitIgnored", { fg = p.gray_500, italic = true })
hl(0, "NvimTreeGitModified", { fg = p.yellow_400 })
hl(0, "NvimTreeGitUnstaged", { fg = p.orange_500 })
hl(0, "NvimTreeGitUntracked", { fg = p.cyan_400 })
hl(0, "NvimTreeGitStaged", { fg = p.emerald_400 })
hl(0, "NvimTreeCursorLine", { bg = p.gray_800 })

-- BufferLine
hl(0, "BufferLineFill", { bg = p.gray_950 })
hl(0, "BufferLineBackground", { bg = p.gray_950, fg = p.gray_600 })
hl(0, "BufferLineBufferSelected", { bg = p.gray_900, fg = p.gray_50, bold = true })
hl(0, "BufferLineBufferVisible", { bg = p.gray_950, fg = p.gray_200 })
hl(0, "BufferLineTab", { bg = p.gray_950, fg = p.gray_600 })
hl(0, "BufferLineTabSelected", { bg = p.gray_900, fg = p.gray_50, bold = true })
hl(0, "BufferLineTabSeparator", { fg = p.gray_950, bg = p.gray_950 })
hl(0, "BufferLineTabSeparatorSelected", { fg = p.gray_950, bg = p.gray_900 })
hl(0, "BufferLineSeparator", { fg = p.gray_950, bg = p.gray_950 })
hl(0, "BufferLineSeparatorSelected", { fg = p.gray_950, bg = p.gray_900 })
hl(0, "BufferLineSeparatorVisible", { fg = p.gray_950, bg = p.gray_950 })
hl(0, "BufferLineIndicatorSelected", { fg = p.teal_500, bg = p.gray_900 })
hl(0, "BufferLineIndicatorVisible", { fg = p.gray_600, bg = p.gray_950 })
hl(0, "BufferLineModified", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "BufferLineModifiedSelected", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "BufferLineModifiedVisible", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "BufferLineError", { fg = p.red_500, bg = p.gray_950 })
hl(0, "BufferLineErrorSelected", { fg = p.red_500, bg = p.gray_900, bold = true })
hl(0, "BufferLineErrorDiagnostic", { fg = p.red_500, bg = p.gray_950 })
hl(0, "BufferLineErrorDiagnosticSelected", { fg = p.red_500, bg = p.gray_900 })
hl(0, "BufferLineWarning", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "BufferLineWarningSelected", { fg = p.yellow_400, bg = p.gray_900, bold = true })
hl(0, "BufferLineWarningDiagnostic", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "BufferLineWarningDiagnosticSelected", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "BufferLineInfo", { fg = p.cyan_400, bg = p.gray_950 })
hl(0, "BufferLineInfoSelected", { fg = p.cyan_400, bg = p.gray_900, bold = true })
hl(0, "BufferLineInfoDiagnostic", { fg = p.cyan_400, bg = p.gray_950 })
hl(0, "BufferLineInfoDiagnosticSelected", { fg = p.cyan_400, bg = p.gray_900 })
hl(0, "BufferLineHint", { fg = p.teal_400, bg = p.gray_950 })
hl(0, "BufferLineHintSelected", { fg = p.teal_400, bg = p.gray_900, bold = true })
hl(0, "BufferLineHintDiagnostic", { fg = p.teal_400, bg = p.gray_950 })
hl(0, "BufferLineHintDiagnosticSelected", { fg = p.teal_400, bg = p.gray_900 })
hl(0, "BufferLinePick", { fg = p.red_500, bg = p.gray_950, bold = true })
hl(0, "BufferLinePickSelected", { fg = p.red_500, bg = p.gray_900, bold = true })
hl(0, "BufferLinePickVisible", { fg = p.red_500, bg = p.gray_950, bold = true })
hl(0, "BufferLineCloseButton", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "BufferLineCloseButtonSelected", { fg = p.red_500, bg = p.gray_900 })
hl(0, "BufferLineCloseButtonVisible", { fg = p.gray_500, bg = p.gray_950 })
hl(0, "BufferLineDuplicate", { fg = p.gray_600, bg = p.gray_950, italic = true })
hl(0, "BufferLineDuplicateSelected", { fg = p.gray_200, bg = p.gray_900, italic = true })
hl(0, "BufferLineDuplicateVisible", { fg = p.gray_600, bg = p.gray_950, italic = true })
hl(0, "BufferLineNumbers", { fg = p.gray_600, bg = p.gray_950 })
hl(0, "BufferLineNumbersSelected", { fg = p.gray_100, bg = p.gray_900 })

-- GitSigns
hl(0, "GitSignsAdd", { fg = p.emerald_500, bg = p.gray_950 })
hl(0, "GitSignsChange", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "GitSignsDelete", { fg = p.red_500, bg = p.gray_950 })
hl(0, "GitSignsAddNr", { fg = p.emerald_500, bg = p.gray_950 })
hl(0, "GitSignsChangeNr", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "GitSignsDeleteNr", { fg = p.red_500, bg = p.gray_950 })
hl(0, "GitSignsAddLn", { bg = p.emerald_600, fg = p.gray_50 })
hl(0, "GitSignsChangeLn", { bg = p.yellow_500, fg = p.gray_950 })
hl(0, "GitSignsDeleteLn", { bg = p.red_600, fg = p.gray_50 })
hl(0, "GitSignsAddInline", { bg = p.emerald_600, fg = p.gray_50 })
hl(0, "GitSignsChangeInline", { bg = p.yellow_500, fg = p.gray_950 })
hl(0, "GitSignsDeleteInline", { bg = p.red_600, fg = p.gray_50 })
hl(0, "GitSignsCurrentLineBlame", { fg = p.gray_500, italic = true })
hl(0, "GitSignsAddPreview", { fg = p.emerald_400 })
hl(0, "GitSignsDeletePreview", { fg = p.red_500 })
hl(0, "GitSignsAddVirtLn", { bg = p.emerald_600, fg = p.gray_50 })
hl(0, "GitSignsDeleteVirtLn", { bg = p.red_600, fg = p.gray_50 })

-- Notify
hl(0, "NotifyERRORBorder", { fg = p.red_500, bg = p.gray_900 })
hl(0, "NotifyERRORIcon", { fg = p.red_500 })
hl(0, "NotifyERRORTitle", { fg = p.red_500, bold = true })
hl(0, "NotifyERRORBody", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "NotifyWARNBorder", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "NotifyWARNIcon", { fg = p.yellow_400 })
hl(0, "NotifyWARNTitle", { fg = p.yellow_400, bold = true })
hl(0, "NotifyWARNBody", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "NotifyINFOBorder", { fg = p.cyan_400, bg = p.gray_900 })
hl(0, "NotifyINFOIcon", { fg = p.cyan_400 })
hl(0, "NotifyINFOTitle", { fg = p.cyan_400, bold = true })
hl(0, "NotifyINFOBody", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "NotifyDEBUGBorder", { fg = p.gray_500, bg = p.gray_900 })
hl(0, "NotifyDEBUGIcon", { fg = p.gray_500 })
hl(0, "NotifyDEBUGTitle", { fg = p.gray_500, bold = true })
hl(0, "NotifyDEBUGBody", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "NotifyTRACEBorder", { fg = p.fuchsia_400, bg = p.gray_900 })
hl(0, "NotifyTRACEIcon", { fg = p.fuchsia_400 })
hl(0, "NotifyTRACETitle", { fg = p.fuchsia_400, bold = true })
hl(0, "NotifyTRACEBody", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "NotifyBackground", { bg = p.gray_900 })

-- WhichKey
hl(0, "WhichKey", { fg = p.teal_400, bold = true })
hl(0, "WhichKeyGroup", { fg = p.fuchsia_400 })
hl(0, "WhichKeyDesc", { fg = p.gray_100 })
hl(0, "WhichKeySeparator", { fg = p.gray_500 })
hl(0, "WhichKeyFloat", { bg = p.gray_900 })
hl(0, "WhichKeyBorder", { fg = p.teal_500, bg = p.gray_900 })
hl(0, "WhichKeyValue", { fg = p.gray_500 })

-- Indent Blankline
hl(0, "IblIndent", { fg = p.gray_700, nocombine = true })
hl(0, "IblWhitespace", { fg = p.gray_700, nocombine = true })
hl(0, "IblScope", { fg = p.teal_600, nocombine = true })
hl(0, "IndentBlanklineChar", { fg = p.gray_700 })
hl(0, "IndentBlanklineSpaceChar", { fg = p.gray_700 })
hl(0, "IndentBlanklineContextChar", { fg = p.teal_600 })
hl(0, "IndentBlanklineContextStart", { underline = true, sp = p.teal_600 })

-- Dashboard / Alpha
hl(0, "DashboardHeader", { fg = p.fuchsia_400, bold = true })
hl(0, "DashboardCenter", { fg = p.cyan_400 })
hl(0, "DashboardShortCut", { fg = p.yellow_400 })
hl(0, "DashboardFooter", { fg = p.gray_500, italic = true })
hl(0, "AlphaHeader", { fg = p.fuchsia_400, bold = true })
hl(0, "AlphaButtons", { fg = p.cyan_400 })
hl(0, "AlphaShortcut", { fg = p.yellow_400, bold = true })
hl(0, "AlphaFooter", { fg = p.gray_500, italic = true })

-- Noice
hl(0, "NoicePopup", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "NoicePopupBorder", { fg = p.teal_500, bg = p.gray_900 })
hl(0, "NoiceCmdline", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "NoiceCmdlinePopup", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "NoiceCmdlinePopupBorder", { fg = p.teal_500, bg = p.gray_800 })
hl(0, "NoiceCmdlinePopupTitle", { fg = p.gray_950, bg = p.teal_500, bold = true })
hl(0, "NoiceCmdlineIcon", { fg = p.cyan_400 })
hl(0, "NoiceCmdlineIconSearch", { fg = p.yellow_400 })
hl(0, "NoiceConfirm", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "NoiceConfirmBorder", { fg = p.cyan_400, bg = p.gray_900 })
hl(0, "NoiceMini", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "NoiceFormatProgressDone", { bg = p.emerald_500, fg = p.gray_950 })
hl(0, "NoiceFormatProgressTodo", { bg = p.gray_800, fg = p.gray_500 })
hl(0, "NoiceLspProgressClient", { fg = p.fuchsia_400 })
hl(0, "NoiceLspProgressSpinner", { fg = p.cyan_400 })
hl(0, "NoiceLspProgressTitle", { fg = p.gray_100 })

-- Cmp (Completion)
hl(0, "CmpNormal", { bg = p.gray_800, fg = p.gray_100 })
hl(0, "CmpBorder", { fg = p.gray_700, bg = p.gray_800 })
hl(0, "CmpDocumentation", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "CmpDocumentationBorder", { fg = p.gray_700, bg = p.gray_900 })
hl(0, "CmpItemAbbr", { fg = p.gray_100 })
hl(0, "CmpItemAbbrDeprecated", { fg = p.gray_500, strikethrough = true })
hl(0, "CmpItemAbbrMatch", { fg = p.emerald_300, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = p.emerald_400, bold = true })
hl(0, "CmpItemMenu", { fg = p.gray_500, italic = true })
hl(0, "CmpItemKind", { fg = p.cyan_400 })
hl(0, "CmpItemKindText", { fg = p.gray_100 })
hl(0, "CmpItemKindMethod", { fg = p.blue_500 })
hl(0, "CmpItemKindFunction", { fg = p.blue_500 })
hl(0, "CmpItemKindConstructor", { fg = p.cyan_400 })
hl(0, "CmpItemKindField", { fg = p.teal_300 })
hl(0, "CmpItemKindVariable", { fg = p.gray_100 })
hl(0, "CmpItemKindClass", { fg = p.cyan_400 })
hl(0, "CmpItemKindInterface", { fg = p.cyan_400 })
hl(0, "CmpItemKindModule", { fg = p.cyan_400 })
hl(0, "CmpItemKindProperty", { fg = p.teal_300 })
hl(0, "CmpItemKindUnit", { fg = p.orange_500 })
hl(0, "CmpItemKindValue", { fg = p.orange_500 })
hl(0, "CmpItemKindEnum", { fg = p.cyan_400 })
hl(0, "CmpItemKindKeyword", { fg = p.fuchsia_400 })
hl(0, "CmpItemKindSnippet", { fg = p.teal_400 })
hl(0, "CmpItemKindColor", { fg = p.pink_500 })
hl(0, "CmpItemKindFile", { fg = p.blue_500 })
hl(0, "CmpItemKindReference", { fg = p.cyan_400 })
hl(0, "CmpItemKindFolder", { fg = p.blue_500 })
hl(0, "CmpItemKindEnumMember", { fg = p.orange_500 })
hl(0, "CmpItemKindConstant", { fg = p.orange_500 })
hl(0, "CmpItemKindStruct", { fg = p.cyan_400 })
hl(0, "CmpItemKindEvent", { fg = p.fuchsia_400 })
hl(0, "CmpItemKindOperator", { fg = p.teal_400 })
hl(0, "CmpItemKindTypeParameter", { fg = p.cyan_400 })
hl(0, "CmpItemKindCopilot", { fg = p.teal_400 })
hl(0, "CmpItemKindCodeium", { fg = p.teal_400 })
hl(0, "CmpItemKindTabNine", { fg = p.teal_400 })
hl(0, "CmpItemKindSuperMaven", { fg = p.teal_400 })

-- Trouble
hl(0, "TroubleNormal", { bg = p.gray_900, fg = p.gray_100 })
hl(0, "TroubleText", { fg = p.gray_100 })
hl(0, "TroubleCount", { fg = p.fuchsia_400, bold = true })
hl(0, "TroubleCode", { fg = p.gray_500 })
hl(0, "TroubleDirectory", { fg = p.blue_500 })
hl(0, "TroubleSource", { fg = p.gray_500 })
hl(0, "TroubleFile", { fg = p.cyan_400 })
hl(0, "TroubleIndent", { fg = p.gray_600 })
hl(0, "TroubleLocation", { fg = p.gray_500 })
hl(0, "TroubleFoldIcon", { fg = p.fuchsia_400 })
hl(0, "TroubleTextError", { fg = p.red_500 })
hl(0, "TroubleTextWarning", { fg = p.yellow_400 })
hl(0, "TroubleTextInformation", { fg = p.cyan_400 })
hl(0, "TroubleTextHint", { fg = p.teal_400 })
hl(0, "TroubleSignError", { fg = p.red_500 })
hl(0, "TroubleSignWarning", { fg = p.yellow_400 })
hl(0, "TroubleSignInformation", { fg = p.cyan_400 })
hl(0, "TroubleSignHint", { fg = p.teal_400 })

-- Todo Comments
hl(0, "TodoBgFIX", { fg = p.gray_950, bg = p.red_500, bold = true })
hl(0, "TodoBgHACK", { fg = p.gray_950, bg = p.yellow_400, bold = true })
hl(0, "TodoBgNOTE", { fg = p.gray_950, bg = p.cyan_400, bold = true })
hl(0, "TodoBgPERF", { fg = p.gray_950, bg = p.fuchsia_400, bold = true })
hl(0, "TodoBgTODO", { fg = p.gray_950, bg = p.emerald_400, bold = true })
hl(0, "TodoBgWARN", { fg = p.gray_950, bg = p.orange_500, bold = true })
hl(0, "TodoFgFIX", { fg = p.red_500 })
hl(0, "TodoFgHACK", { fg = p.yellow_400 })
hl(0, "TodoFgNOTE", { fg = p.cyan_400 })
hl(0, "TodoFgPERF", { fg = p.fuchsia_400 })
hl(0, "TodoFgTODO", { fg = p.emerald_400 })
hl(0, "TodoFgWARN", { fg = p.orange_500 })
hl(0, "TodoSignFIX", { fg = p.red_500, bg = p.gray_950 })
hl(0, "TodoSignHACK", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "TodoSignNOTE", { fg = p.cyan_400, bg = p.gray_950 })
hl(0, "TodoSignPERF", { fg = p.fuchsia_400, bg = p.gray_950 })
hl(0, "TodoSignTODO", { fg = p.emerald_400, bg = p.gray_950 })
hl(0, "TodoSignWARN", { fg = p.orange_500, bg = p.gray_950 })

-- Leap
hl(0, "LeapMatch", { fg = p.emerald_300, bold = true, underline = true })
hl(0, "LeapLabel", { fg = p.gray_950, bg = p.emerald_300, bold = true })
hl(0, "LeapBackdrop", { fg = p.gray_600 })

-- Flash
hl(0, "FlashBackdrop", { fg = p.gray_600 })
hl(0, "FlashLabel", { fg = p.gray_950, bg = p.pink_500, bold = true })
hl(0, "FlashMatch", { fg = p.cyan_400, bold = true })
hl(0, "FlashCurrent", { fg = p.orange_500, bold = true })

-- Mini plugins
hl(0, "MiniCompletionActiveParameter", { underline = true })
hl(0, "MiniCursorword", { underline = true })
hl(0, "MiniCursorwordCurrent", { underline = true })
hl(0, "MiniIndentscopeSymbol", { fg = p.teal_600 })
hl(0, "MiniIndentscopePrefix", { nocombine = true })
hl(0, "MiniJump", { fg = p.gray_950, bg = p.pink_500, bold = true })
hl(0, "MiniJump2dSpot", { fg = p.gray_950, bg = p.yellow_400, bold = true })
hl(0, "MiniStarterCurrent", { nocombine = true })
hl(0, "MiniStarterFooter", { fg = p.gray_500, italic = true })
hl(0, "MiniStarterHeader", { fg = p.fuchsia_400, bold = true })
hl(0, "MiniStarterInactive", { fg = p.gray_500, italic = true })
hl(0, "MiniStarterItem", { fg = p.gray_100 })
hl(0, "MiniStarterItemBullet", { fg = p.gray_600 })
hl(0, "MiniStarterItemPrefix", { fg = p.yellow_400 })
hl(0, "MiniStarterSection", { fg = p.cyan_400, bold = true })
hl(0, "MiniStarterQuery", { fg = p.emerald_400 })
hl(0, "MiniStatuslineDevinfo", { fg = p.gray_100, bg = p.gray_800 })
hl(0, "MiniStatuslineFileinfo", { fg = p.gray_100, bg = p.gray_800 })
hl(0, "MiniStatuslineFilename", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "MiniStatuslineInactive", { fg = p.gray_600, bg = p.gray_950 })
hl(0, "MiniStatuslineModeCommand", { fg = p.gray_950, bg = p.yellow_400, bold = true })
hl(0, "MiniStatuslineModeInsert", { fg = p.gray_950, bg = p.blue_500, bold = true })
hl(0, "MiniStatuslineModeNormal", { fg = p.gray_950, bg = p.teal_500, bold = true })
hl(0, "MiniStatuslineModeOther", { fg = p.gray_950, bg = p.cyan_400, bold = true })
hl(0, "MiniStatuslineModeReplace", { fg = p.gray_950, bg = p.red_500, bold = true })
hl(0, "MiniStatuslineModeVisual", { fg = p.gray_950, bg = p.emerald_400, bold = true })
hl(0, "MiniSurround", { bg = p.orange_500, fg = p.gray_950 })
hl(0, "MiniTablineCurrent", { fg = p.gray_50, bg = p.gray_900, bold = true })
hl(0, "MiniTablineFill", { bg = p.gray_950 })
hl(0, "MiniTablineHidden", { fg = p.gray_600, bg = p.gray_950 })
hl(0, "MiniTablineModifiedCurrent", { fg = p.yellow_400, bg = p.gray_900 })
hl(0, "MiniTablineModifiedHidden", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "MiniTablineModifiedVisible", { fg = p.yellow_400, bg = p.gray_950 })
hl(0, "MiniTablineTabpagesection", { fg = p.gray_950, bg = p.teal_500, bold = true })
hl(0, "MiniTablineVisible", { fg = p.gray_200, bg = p.gray_950 })
hl(0, "MiniTestEmphasis", { bold = true })
hl(0, "MiniTestFail", { fg = p.red_500, bold = true })
hl(0, "MiniTestPass", { fg = p.emerald_400, bold = true })
hl(0, "MiniTrailspace", { bg = p.red_500 })

-- Neotest
hl(0, "NeotestAdapterName", { fg = p.fuchsia_400, bold = true })
hl(0, "NeotestBorder", { fg = p.teal_500 })
hl(0, "NeotestDir", { fg = p.cyan_400 })
hl(0, "NeotestExpandMarker", { fg = p.gray_500 })
hl(0, "NeotestFailed", { fg = p.red_500 })
hl(0, "NeotestFile", { fg = p.cyan_400 })
hl(0, "NeotestFocused", { bold = true })
hl(0, "NeotestIndent", { fg = p.gray_600 })
hl(0, "NeotestMarked", { fg = p.orange_500, bold = true })
hl(0, "NeotestNamespace", { fg = p.blue_500 })
hl(0, "NeotestPassed", { fg = p.emerald_400 })
hl(0, "NeotestRunning", { fg = p.yellow_400 })
hl(0, "NeotestSkipped", { fg = p.cyan_400 })
hl(0, "NeotestTarget", { fg = p.fuchsia_400 })
hl(0, "NeotestTest", { fg = p.gray_100 })
hl(0, "NeotestWinSelect", { fg = p.cyan_400, bold = true })
hl(0, "NeotestUnknown", { fg = p.gray_500 })
hl(0, "NeotestWatching", { fg = p.yellow_400 })

-- Dap (Debug Adapter Protocol)
hl(0, "DapBreakpoint", { fg = p.red_500 })
hl(0, "DapBreakpointCondition", { fg = p.yellow_400 })
hl(0, "DapBreakpointRejected", { fg = p.gray_500 })
hl(0, "DapLogPoint", { fg = p.cyan_400 })
hl(0, "DapStopped", { fg = p.emerald_400 })
hl(0, "DapUIVariable", { fg = p.gray_100 })
hl(0, "DapUIScope", { fg = p.cyan_400 })
hl(0, "DapUIType", { fg = p.cyan_400 })
hl(0, "DapUIValue", { fg = p.gray_100 })
hl(0, "DapUIModifiedValue", { fg = p.orange_500, bold = true })
hl(0, "DapUIDecoration", { fg = p.cyan_400 })
hl(0, "DapUIThread", { fg = p.emerald_400 })
hl(0, "DapUIStoppedThread", { fg = p.cyan_400 })
hl(0, "DapUIFrameName", { fg = p.gray_100 })
hl(0, "DapUISource", { fg = p.fuchsia_400 })
hl(0, "DapUILineNumber", { fg = p.cyan_400 })
hl(0, "DapUIFloatBorder", { fg = p.teal_500, bg = p.gray_900 })
hl(0, "DapUIWatchesEmpty", { fg = p.red_500 })
hl(0, "DapUIWatchesValue", { fg = p.emerald_400 })
hl(0, "DapUIWatchesError", { fg = p.red_500 })
hl(0, "DapUIBreakpointsPath", { fg = p.cyan_400 })
hl(0, "DapUIBreakpointsInfo", { fg = p.emerald_400 })
hl(0, "DapUIBreakpointsCurrentLine", { fg = p.emerald_400, bold = true })
hl(0, "DapUIBreakpointsLine", { link = "DapUILineNumber" })
hl(0, "DapUIBreakpointsDisabledLine", { fg = p.gray_500 })
hl(0, "DapUICurrentFrameName", { link = "DapUIBreakpointsCurrentLine" })
hl(0, "DapUIStepOver", { fg = p.cyan_400 })
hl(0, "DapUIStepInto", { fg = p.cyan_400 })
hl(0, "DapUIStepBack", { fg = p.cyan_400 })
hl(0, "DapUIStepOut", { fg = p.cyan_400 })
hl(0, "DapUIStop", { fg = p.red_500 })
hl(0, "DapUIPlayPause", { fg = p.emerald_400 })
hl(0, "DapUIRestart", { fg = p.emerald_400 })
hl(0, "DapUIUnavailable", { fg = p.gray_500 })

-- Yanky
hl(0, "YankyPut", { link = "IncSearch" })
hl(0, "YankyYanked", { link = "IncSearch" })

-- Tmux Status
hl(0, "TmuxStatusNormal", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "TmuxStatusSession", { fg = p.teal_400, bg = p.gray_900, bold = true })
hl(0, "TmuxStatusWindow", { fg = p.gray_100, bg = p.gray_900 })
hl(0, "TmuxStatusWindowActive", { fg = p.teal_400, bg = p.gray_900, bold = true })
hl(0, "TmuxStatusPane", { fg = p.gray_500, bg = p.gray_900 })
hl(0, "TmuxStatusPaneActive", { fg = p.teal_300, bg = p.gray_900 })
hl(0, "TmuxStatusPrefix", { fg = p.fuchsia_400, bg = p.gray_900 })
hl(0, "TmuxStatusClock", { fg = p.yellow_400, bg = p.gray_900 })

-- =============================================================================
-- 5. INTEGRATIONS & ADDITIONAL PLUGINS
-- =============================================================================

-- Vim-Illuminate
hl(0, "IlluminatedWordText", { bg = p.gray_800 })
hl(0, "IlluminatedWordRead", { bg = p.gray_800 })
hl(0, "IlluminatedWordWrite", { bg = p.gray_800 })

-- Hlargs
hl(0, "Hlargs", { fg = p.orange_500 })

-- Ensure cursor is always visible
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

