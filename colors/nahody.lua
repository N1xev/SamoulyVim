vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "nahody"
vim.o.termguicolors = true

local p = {
  -- Background layers (soft dark grays instead of pure black)
  bg = "#1a1625", -- Main background (softer than pure black)
  bg_dark = "#141119", -- Darker variant
  bg_light = "#211d2b", -- Lighter variant
  bg_highlight = "#2a2636", -- Highlighted background
  bg_visual = "#352d47", -- Visual selection

  -- Foreground text (off-white, not pure white to reduce halation)
  fg = "#cfc3d9", -- Main text (softer white)
  fg_dark = "#a895b8", -- Dimmed text
  fg_light = "#e6ddf0", -- Bright text

  -- Gray scale (for UI elements)
  gray1 = "#2d2837", -- Subtle UI elements
  gray2 = "#3d3548", -- Borders, separators
  gray3 = "#4d4458", -- Inactive elements
  gray4 = "#6d5f7e", -- Comments
  gray5 = "#8d7f9e", -- Dimmed code

  -- Primary accent colors (reduced saturation, warmer tones)
  purple = "#b084f2", -- Keywords, primary UI (softened)
  blue = "#7dadfa", -- Functions, info (calmer blue)
  cyan = "#67d4d4", -- Properties, links (teal instead of harsh cyan)
  teal = "#4db8a8", -- Special tokens (calming teal)

  -- Secondary colors (earth tones, less vibrant)
  orange = "#f2a374", -- Strings, numbers (warm, not harsh)
  peach = "#f2c6a2", -- Parameters (soft peach)
  yellow = "#e8d07a", -- Types, warnings (muted yellow)
  gold = "#d4b87e", -- Special highlights

  -- Nature-inspired alternatives (replacing harsh green)
  sage = "#87c2a0", -- Success states (soft sage green)
  mint = "#9ed4b8", -- Additions, confirmations
  seafoam = "#7fc4b8", -- Strings in some contexts

  -- Semantic colors (adjusted for better visibility)
  error = "#f27a7a", -- Errors (softer red)
  warning = "#f2c674", -- Warnings (amber)
  info = "#74c2f2", -- Information (sky blue)
  hint = "#8ec4b8", -- Hints (teal)

  -- Special highlights
  magenta = "#e084d4", -- Special keywords
  pink = "#f2a8d4", -- Emphasis

  none = "NONE",
}

-- =============================================================================
-- TERMINAL COLORS
-- =============================================================================
vim.g.terminal_color_0 = p.bg_light
vim.g.terminal_color_1 = p.error
vim.g.terminal_color_2 = p.sage
vim.g.terminal_color_3 = p.yellow
vim.g.terminal_color_4 = p.blue
vim.g.terminal_color_5 = p.purple
vim.g.terminal_color_6 = p.cyan
vim.g.terminal_color_7 = p.fg
vim.g.terminal_color_8 = p.gray5
vim.g.terminal_color_9 = p.error
vim.g.terminal_color_10 = p.mint
vim.g.terminal_color_11 = p.gold
vim.g.terminal_color_12 = p.blue
vim.g.terminal_color_13 = p.magenta
vim.g.terminal_color_14 = p.teal
vim.g.terminal_color_15 = p.fg_light

local hl = vim.api.nvim_set_hl

-- =============================================================================
-- EDITOR CORE UI - Optimized for Eye Comfort
-- =============================================================================
hl(0, "Normal", { fg = p.fg, bg = p.bg })
hl(0, "NormalNC", { fg = p.fg_dark, bg = p.bg })
hl(0, "NormalFloat", { fg = p.fg, bg = p.bg_light })
hl(0, "FloatBorder", { fg = p.purple, bg = p.bg_light })
hl(0, "FloatTitle", { fg = p.bg, bg = p.purple, bold = true })

-- Cursor (high contrast for visibility)
hl(0, "Cursor", { bg = p.fg_light, fg = p.bg })
hl(0, "lCursor", { link = "Cursor" })
hl(0, "CursorIM", { link = "Cursor" })
hl(0, "TermCursor", { bg = p.fg_light, fg = p.bg })
hl(0, "TermCursorNC", { bg = p.gray5, fg = p.bg })

-- Line highlighting (subtle, not distracting)
hl(0, "CursorLine", { bg = p.bg_highlight })
hl(0, "CursorColumn", { bg = p.bg_highlight })
hl(0, "ColorColumn", { bg = p.bg_light })
hl(0, "LineNr", { fg = p.gray4 })
hl(0, "CursorLineNr", { fg = p.purple, bold = true })
hl(0, "CursorLineFold", { fg = p.yellow, bg = p.bg_highlight })
hl(0, "CursorLineSign", { fg = p.purple, bg = p.bg_highlight })
hl(0, "SignColumn", { bg = p.bg })
hl(0, "FoldColumn", { fg = p.gray5, bg = p.bg })

-- Window separators (subtle but visible)
hl(0, "VertSplit", { fg = p.gray2, bg = p.bg })
hl(0, "WinSeparator", { fg = p.gray2, bg = p.bg })
hl(0, "WinBar", { fg = p.purple, bg = p.bg, bold = true })
hl(0, "WinBarNC", { fg = p.gray5, bg = p.bg })

-- Visual selection (clear but not overwhelming)
hl(0, "Visual", { bg = p.bg_visual })
hl(0, "VisualNOS", { bg = p.bg_visual })

-- Search (distinct colors for different search types)
hl(0, "Search", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "IncSearch", { bg = p.yellow, fg = p.bg, bold = true })
hl(0, "CurSearch", { bg = p.orange, fg = p.bg, bold = true })
hl(0, "Substitute", { bg = p.error, fg = p.bg })

-- Status and tab lines
hl(0, "StatusLine", { fg = p.fg, bg = p.bg_light })
hl(0, "StatusLineNC", { fg = p.gray5, bg = p.bg_dark })
hl(0, "TabLine", { fg = p.gray5, bg = p.bg_dark })
hl(0, "TabLineFill", { bg = p.bg_dark })
hl(0, "TabLineSel", { fg = p.fg, bg = p.bg_light, bold = true })

-- UI elements
hl(0, "Title", { fg = p.purple, bold = true })
hl(0, "Directory", { fg = p.blue })
hl(0, "EndOfBuffer", { fg = p.bg })
hl(0, "Conceal", { fg = p.gray5 })
hl(0, "NonText", { fg = p.gray3 })
hl(0, "SpecialKey", { fg = p.gray3 })
hl(0, "Whitespace", { fg = p.gray2 })
hl(0, "Question", { fg = p.sage, bold = true })
hl(0, "QuickFixLine", { bg = p.bg_visual, bold = true })

-- Popup menus (clear hierarchy)
hl(0, "Pmenu", { bg = p.bg_light, fg = p.fg })
hl(0, "PmenuSel", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "PmenuSbar", { bg = p.bg_light })
hl(0, "PmenuThumb", { bg = p.gray5 })
hl(0, "PmenuKind", { bg = p.bg_light, fg = p.cyan })
hl(0, "PmenuKindSel", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "PmenuExtra", { bg = p.bg_light, fg = p.gray5 })
hl(0, "PmenuExtraSel", { bg = p.purple, fg = p.bg })
hl(0, "WildMenu", { bg = p.purple, fg = p.bg, bold = true })

-- Matching & Folding
hl(0, "MatchParen", { fg = p.pink, bold = true, underline = true })
hl(0, "Folded", { bg = p.bg_highlight, fg = p.gray5, italic = true })

-- Messages
hl(0, "ModeMsg", { fg = p.sage, bold = true })
hl(0, "MoreMsg", { fg = p.cyan, bold = true })
hl(0, "WarningMsg", { fg = p.warning, bold = true })
hl(0, "ErrorMsg", { fg = p.error, bold = true })
hl(0, "MsgArea", { fg = p.fg, bg = p.bg })
hl(0, "MsgSeparator", { fg = p.gray2, bg = p.bg })

-- Spelling (subtle underlines)
hl(0, "SpellBad", { undercurl = true, sp = p.error })
hl(0, "SpellCap", { undercurl = true, sp = p.warning })
hl(0, "SpellLocal", { undercurl = true, sp = p.cyan })
hl(0, "SpellRare", { undercurl = true, sp = p.purple })

-- Diff mode (clear visual distinction)
hl(0, "DiffAdd", { bg = p.sage, fg = p.bg })
hl(0, "DiffChange", { bg = p.yellow, fg = p.bg })
hl(0, "DiffDelete", { bg = p.error, fg = p.bg })
hl(0, "DiffText", { bg = p.orange, fg = p.bg, bold = true })
hl(0, "diffAdded", { fg = p.sage })
hl(0, "diffRemoved", { fg = p.error })
hl(0, "diffChanged", { fg = p.yellow })
hl(0, "diffOldFile", { fg = p.error })
hl(0, "diffNewFile", { fg = p.sage })
hl(0, "diffFile", { fg = p.cyan })
hl(0, "diffLine", { fg = p.gray5 })
hl(0, "diffIndexLine", { fg = p.purple })

-- =============================================================================
-- SYNTAX HIGHLIGHTING - Research-Based Best Practices
-- =============================================================================
-- Based on studies showing that:
-- 1. Comments should be visible but not prominent (medium gray)
-- 2. Keywords benefit from consistent, distinct colors
-- 3. Strings/literals use warm colors for easy identification
-- 4. Functions/methods use cool colors (blue family)
-- 5. Reduced color variety prevents "angry fruit salad"
-- =============================================================================

-- Comments (clearly visible but recessed)
hl(0, "Comment", { fg = p.gray4, italic = true })

-- Constants & Literals (warm tones)
hl(0, "Constant", { fg = p.orange })
hl(0, "String", { fg = p.orange })
hl(0, "Character", { fg = p.seafoam })
hl(0, "Number", { fg = p.peach })
hl(0, "Boolean", { fg = p.orange, bold = true })
hl(0, "Float", { fg = p.peach })

-- Identifiers (neutral, let other elements stand out)
hl(0, "Identifier", { fg = p.fg })
hl(0, "Function", { fg = p.blue })

-- Statements & Keywords (purple family for consistency)
hl(0, "Statement", { fg = p.purple })
hl(0, "Conditional", { fg = p.purple, italic = true })
hl(0, "Repeat", { fg = p.purple, italic = true })
hl(0, "Label", { fg = p.magenta })
hl(0, "Operator", { fg = p.cyan })
hl(0, "Keyword", { fg = p.purple, bold = true })
hl(0, "Exception", { fg = p.error, bold = true })

-- Preprocessor
hl(0, "PreProc", { fg = p.magenta })
hl(0, "Include", { fg = p.purple })
hl(0, "Define", { fg = p.purple })
hl(0, "Macro", { fg = p.teal })
hl(0, "PreCondit", { fg = p.purple })

-- Types (yellow family for distinction)
hl(0, "Type", { fg = p.yellow })
hl(0, "StorageClass", { fg = p.purple })
hl(0, "Structure", { fg = p.yellow })
hl(0, "Typedef", { fg = p.yellow })

-- Special elements
hl(0, "Special", { fg = p.teal })
hl(0, "SpecialChar", { fg = p.mint })
hl(0, "Tag", { fg = p.purple })
hl(0, "Delimiter", { fg = p.fg })
hl(0, "SpecialComment", { fg = p.cyan, italic = true })
hl(0, "Debug", { fg = p.error })
hl(0, "Underlined", { underline = true })
hl(0, "Ignore", { fg = p.gray3 })
hl(0, "Error", { fg = p.error, bold = true })
hl(0, "Todo", { fg = p.bg, bg = p.yellow, bold = true })

-- =============================================================================
-- TREESITTER - Modern Syntax Highlighting
-- =============================================================================

-- Variables
hl(0, "@variable", { fg = p.fg })
hl(0, "@variable.builtin", { fg = p.magenta })
hl(0, "@variable.parameter", { fg = p.peach })
hl(0, "@variable.member", { fg = p.cyan })

-- Constants
hl(0, "@constant", { fg = p.orange })
hl(0, "@constant.builtin", { fg = p.orange, bold = true })
hl(0, "@constant.macro", { fg = p.teal })
hl(0, "@module", { fg = p.yellow })
hl(0, "@label", { fg = p.magenta })

-- Functions
hl(0, "@function", { fg = p.blue })
hl(0, "@function.builtin", { fg = p.info })
hl(0, "@function.call", { fg = p.blue })
hl(0, "@function.macro", { fg = p.teal })
hl(0, "@function.method", { fg = p.blue })
hl(0, "@function.method.call", { fg = p.blue })
hl(0, "@constructor", { fg = p.yellow })
hl(0, "@parameter", { fg = p.peach })

-- Keywords
hl(0, "@keyword", { fg = p.purple, bold = true })
hl(0, "@keyword.function", { fg = p.purple, bold = true })
hl(0, "@keyword.operator", { fg = p.purple })
hl(0, "@keyword.import", { fg = p.purple })
hl(0, "@keyword.return", { fg = p.magenta, italic = true })
hl(0, "@keyword.conditional", { fg = p.purple, italic = true })
hl(0, "@keyword.repeat", { fg = p.purple, italic = true })
hl(0, "@keyword.exception", { fg = p.error, bold = true })
hl(0, "@keyword.storage", { fg = p.purple })

-- Strings
hl(0, "@string", { fg = p.orange })
hl(0, "@string.documentation", { fg = p.seafoam, italic = true })
hl(0, "@string.regexp", { fg = p.mint })
hl(0, "@string.escape", { fg = p.teal })
hl(0, "@string.special", { fg = p.mint })
hl(0, "@string.special.symbol", { fg = p.cyan })
hl(0, "@string.special.url", { fg = p.info, underline = true })
hl(0, "@string.special.path", { fg = p.seafoam })
hl(0, "@character", { fg = p.seafoam })
hl(0, "@character.special", { fg = p.teal })

-- Types
hl(0, "@type", { fg = p.yellow })
hl(0, "@type.builtin", { fg = p.yellow, italic = true })
hl(0, "@type.definition", { fg = p.yellow })
hl(0, "@type.qualifier", { fg = p.purple })
hl(0, "@attribute", { fg = p.teal })
hl(0, "@property", { fg = p.cyan })
hl(0, "@field", { fg = p.cyan })

-- Operators & Punctuation
hl(0, "@operator", { fg = p.cyan })
hl(0, "@punctuation.delimiter", { fg = p.fg_dark })
hl(0, "@punctuation.bracket", { fg = p.fg })
hl(0, "@punctuation.special", { fg = p.cyan })

-- Comments
hl(0, "@comment", { fg = p.gray4, italic = true })
hl(0, "@comment.documentation", { fg = p.gray5, italic = true })
hl(0, "@comment.error", { fg = p.error, bg = p.bg_highlight })
hl(0, "@comment.warning", { fg = p.warning, bg = p.bg_highlight })
hl(0, "@comment.todo", { fg = p.bg, bg = p.yellow, bold = true })
hl(0, "@comment.note", { fg = p.cyan, bg = p.bg_highlight })

-- Tags (HTML/JSX/XML)
hl(0, "@tag", { fg = p.purple })
hl(0, "@tag.builtin", { fg = p.purple, bold = true })
hl(0, "@tag.attribute", { fg = p.cyan })
hl(0, "@tag.delimiter", { fg = p.fg_dark })

-- Markup (Markdown)
hl(0, "@markup.strong", { bold = true })
hl(0, "@markup.italic", { italic = true })
hl(0, "@markup.strikethrough", { strikethrough = true })
hl(0, "@markup.underline", { underline = true })
hl(0, "@markup.heading", { fg = p.purple, bold = true })
hl(0, "@markup.heading.1", { fg = p.purple, bold = true })
hl(0, "@markup.heading.2", { fg = p.blue, bold = true })
hl(0, "@markup.heading.3", { fg = p.cyan, bold = true })
hl(0, "@markup.heading.4", { fg = p.sage, bold = true })
hl(0, "@markup.heading.5", { fg = p.yellow, bold = true })
hl(0, "@markup.heading.6", { fg = p.orange, bold = true })
hl(0, "@markup.quote", { fg = p.gray4, italic = true })
hl(0, "@markup.math", { fg = p.orange })
hl(0, "@markup.environment", { fg = p.purple })
hl(0, "@markup.link", { fg = p.cyan, underline = true })
hl(0, "@markup.link.label", { fg = p.cyan })
hl(0, "@markup.link.url", { fg = p.info, underline = true })
hl(0, "@markup.raw", { fg = p.seafoam })
hl(0, "@markup.raw.block", { fg = p.seafoam })
hl(0, "@markup.list", { fg = p.purple })
hl(0, "@markup.list.checked", { fg = p.sage })
hl(0, "@markup.list.unchecked", { fg = p.gray5 })

-- Numbers & Booleans
hl(0, "@number", { fg = p.peach })
hl(0, "@number.float", { fg = p.peach })
hl(0, "@boolean", { fg = p.orange, bold = true })

-- Diffs
hl(0, "@diff.plus", { fg = p.sage })
hl(0, "@diff.minus", { fg = p.error })
hl(0, "@diff.delta", { fg = p.yellow })

-- Language-specific
hl(0, "@lsp.type.namespace.lua", { fg = p.yellow })
hl(0, "@lsp.type.property.lua", { fg = p.cyan })
hl(0, "@variable.builtin.python", { fg = p.magenta, italic = true })
hl(0, "@variable.builtin.javascript", { fg = p.magenta })
hl(0, "@variable.builtin.typescript", { fg = p.magenta })

-- =============================================================================
-- LSP & DIAGNOSTICS - Clear Visual Feedback
-- =============================================================================

-- LSP References
hl(0, "LspReferenceText", { bg = p.bg_visual })
hl(0, "LspReferenceRead", { bg = p.bg_visual })
hl(0, "LspReferenceWrite", { bg = p.bg_visual, underline = true })
hl(0, "LspSignatureActiveParameter", { fg = p.peach, bold = true })
hl(0, "LspCodeLens", { fg = p.gray4, italic = true })
hl(0, "LspCodeLensSeparator", { fg = p.gray3 })
hl(0, "LspInlayHint", { fg = p.gray4, bg = p.bg_highlight, italic = true })

-- Diagnostics (clear but not overwhelming)
hl(0, "DiagnosticError", { fg = p.error })
hl(0, "DiagnosticWarn", { fg = p.warning })
hl(0, "DiagnosticInfo", { fg = p.info })
hl(0, "DiagnosticHint", { fg = p.hint })
hl(0, "DiagnosticOk", { fg = p.sage })

hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = p.error })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = p.warning })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = p.info })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = p.hint })
hl(0, "DiagnosticUnderlineOk", { undercurl = true, sp = p.sage })

hl(0, "DiagnosticVirtualTextError", { fg = p.error, bg = p.bg_highlight })
hl(0, "DiagnosticVirtualTextWarn", { fg = p.warning, bg = p.bg_highlight })
hl(0, "DiagnosticVirtualTextInfo", { fg = p.info, bg = p.bg_highlight })
hl(0, "DiagnosticVirtualTextHint", { fg = p.hint, bg = p.bg_highlight })
hl(0, "DiagnosticVirtualTextOk", { fg = p.sage, bg = p.bg_highlight })

hl(0, "DiagnosticFloatingError", { fg = p.error, bg = p.bg_light })
hl(0, "DiagnosticFloatingWarn", { fg = p.warning, bg = p.bg_light })
hl(0, "DiagnosticFloatingInfo", { fg = p.info, bg = p.bg_light })
hl(0, "DiagnosticFloatingHint", { fg = p.hint, bg = p.bg_light })
hl(0, "DiagnosticFloatingOk", { fg = p.sage, bg = p.bg_light })

hl(0, "DiagnosticSignError", { fg = p.error, bg = p.bg })
hl(0, "DiagnosticSignWarn", { fg = p.warning, bg = p.bg })
hl(0, "DiagnosticSignInfo", { fg = p.info, bg = p.bg })
hl(0, "DiagnosticSignHint", { fg = p.hint, bg = p.bg })
hl(0, "DiagnosticSignOk", { fg = p.sage, bg = p.bg })

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
-- PLUGIN INTEGRATIONS - Consistent with Core Theme
-- =============================================================================

-- Lazy.nvim
hl(0, "LazyNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "LazyH1", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "LazyH2", { fg = p.purple, bold = true })
hl(0, "LazyButton", { bg = p.bg_visual, fg = p.fg })
hl(0, "LazyButtonActive", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "LazyComment", { fg = p.gray4, italic = true })
hl(0, "LazyCommit", { fg = p.sage })
hl(0, "LazyCommitIssue", { fg = p.error })
hl(0, "LazyCommitType", { fg = p.purple })
hl(0, "LazyCommitScope", { fg = p.cyan })
hl(0, "LazyDimmed", { fg = p.gray4 })
hl(0, "LazyDir", { fg = p.cyan })
hl(0, "LazyLocal", { fg = p.teal })
hl(0, "LazyProp", { fg = p.cyan })
hl(0, "LazyReasonCmd", { fg = p.yellow })
hl(0, "LazyReasonEvent", { fg = p.orange })
hl(0, "LazyReasonFt", { fg = p.purple })
hl(0, "LazyReasonImport", { fg = p.cyan })
hl(0, "LazyReasonKeys", { fg = p.blue })
hl(0, "LazyReasonPlugin", { fg = p.sage })
hl(0, "LazyReasonRuntime", { fg = p.info })
hl(0, "LazyReasonSource", { fg = p.teal })
hl(0, "LazyReasonStart", { fg = p.mint })
hl(0, "LazySpecial", { fg = p.teal })
hl(0, "LazyTaskError", { fg = p.error })
hl(0, "LazyTaskOutput", { fg = p.fg })
hl(0, "LazyUrl", { fg = p.info, underline = true })
hl(0, "LazyValue", { fg = p.cyan })

-- Mason
hl(0, "MasonNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "MasonHeader", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "MasonHeaderSecondary", { bg = p.cyan, fg = p.bg, bold = true })
hl(0, "MasonHighlight", { fg = p.purple })
hl(0, "MasonHighlightBlock", { bg = p.purple, fg = p.bg })
hl(0, "MasonHighlightBlockBold", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "MasonHighlightSecondary", { fg = p.cyan })
hl(0, "MasonHighlightBlockSecondary", { bg = p.cyan, fg = p.bg })
hl(0, "MasonHighlightBlockBoldSecondary", { bg = p.cyan, fg = p.bg, bold = true })
hl(0, "MasonMuted", { fg = p.gray4 })
hl(0, "MasonMutedBlock", { bg = p.bg_visual, fg = p.gray4 })
hl(0, "MasonMutedBlockBold", { bg = p.bg_visual, fg = p.gray4, bold = true })
hl(0, "MasonError", { fg = p.error })
hl(0, "MasonWarning", { fg = p.warning })
hl(0, "MasonHeading", { fg = p.purple, bold = true })

-- Telescope
hl(0, "TelescopeNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "TelescopeBorder", { bg = p.bg_light, fg = p.gray2 })
hl(0, "TelescopeTitle", { fg = p.bg, bg = p.purple, bold = true })
hl(0, "TelescopePromptNormal", { bg = p.bg_highlight, fg = p.fg })
hl(0, "TelescopePromptBorder", { bg = p.bg_highlight, fg = p.bg_highlight })
hl(0, "TelescopePromptTitle", { bg = p.purple, fg = p.bg, bold = true })
hl(0, "TelescopePromptPrefix", { fg = p.purple, bg = p.bg_highlight })
hl(0, "TelescopePromptCounter", { fg = p.gray4, bg = p.bg_highlight })
hl(0, "TelescopePreviewNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "TelescopePreviewBorder", { bg = p.bg_light, fg = p.bg_light })
hl(0, "TelescopePreviewTitle", { bg = p.sage, fg = p.bg, bold = true })
hl(0, "TelescopeResultsNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "TelescopeResultsBorder", { bg = p.bg_light, fg = p.bg_light })
hl(0, "TelescopeResultsTitle", { bg = p.cyan, fg = p.bg, bold = true })
hl(0, "TelescopeSelection", { bg = p.bg_visual, fg = p.fg, bold = true })
hl(0, "TelescopeSelectionCaret", { fg = p.purple, bg = p.bg_visual })
hl(0, "TelescopeMultiSelection", { fg = p.cyan, bg = p.bg_visual })
hl(0, "TelescopeMatching", { fg = p.mint, bold = true })
hl(0, "TelescopePreviewLine", { bg = p.bg_visual })
hl(0, "TelescopePreviewMatch", { bg = p.purple, fg = p.bg })

-- NeoTree / NvimTree
hl(0, "NeoTreeNormal", { bg = p.bg_dark, fg = p.fg })
hl(0, "NeoTreeNormalNC", { bg = p.bg_dark, fg = p.fg })
hl(0, "NeoTreeWinSeparator", { fg = p.bg, bg = p.bg })
hl(0, "NeoTreeEndOfBuffer", { fg = p.bg_dark, bg = p.bg_dark })
hl(0, "NeoTreeRootName", { fg = p.purple, bold = true })
hl(0, "NeoTreeDirectoryName", { fg = p.blue })
hl(0, "NeoTreeDirectoryIcon", { fg = p.blue })
hl(0, "NeoTreeFileName", { fg = p.fg })
hl(0, "NeoTreeFileIcon", { fg = p.fg_dark })
hl(0, "NeoTreeFileNameOpened", { fg = p.cyan, bold = true })
hl(0, "NeoTreeIndentMarker", { fg = p.gray3 })
hl(0, "NeoTreeExpander", { fg = p.gray4 })
hl(0, "NeoTreeSymbolicLinkTarget", { fg = p.cyan })
hl(0, "NeoTreeGitAdded", { fg = p.sage })
hl(0, "NeoTreeGitConflict", { fg = p.error, bold = true })
hl(0, "NeoTreeGitDeleted", { fg = p.error })
hl(0, "NeoTreeGitIgnored", { fg = p.gray4, italic = true })
hl(0, "NeoTreeGitModified", { fg = p.yellow })
hl(0, "NeoTreeGitUnstaged", { fg = p.orange })
hl(0, "NeoTreeGitUntracked", { fg = p.cyan })
hl(0, "NeoTreeGitStaged", { fg = p.sage })
hl(0, "NeoTreeFloatBorder", { fg = p.purple, bg = p.bg_light })
hl(0, "NeoTreeFloatTitle", { fg = p.bg, bg = p.purple, bold = true })
hl(0, "NeoTreeTitleBar", { fg = p.bg, bg = p.purple, bold = true })
hl(0, "NeoTreeCursorLine", { bg = p.bg_highlight })
hl(0, "NeoTreeDimText", { fg = p.gray3 })
hl(0, "NeoTreeFilterTerm", { fg = p.mint, bold = true })
hl(0, "NeoTreeTabActive", { fg = p.fg, bg = p.bg_light, bold = true })
hl(0, "NeoTreeTabInactive", { fg = p.gray4, bg = p.bg_dark })
hl(0, "NeoTreeTabSeparatorActive", { fg = p.bg_light, bg = p.bg_light })
hl(0, "NeoTreeTabSeparatorInactive", { fg = p.bg_dark, bg = p.bg_dark })
hl(0, "NvimTreeNormal", { link = "NeoTreeNormal" })
hl(0, "NvimTreeNormalNC", { link = "NeoTreeNormalNC" })
hl(0, "NvimTreeWinSeparator", { link = "NeoTreeWinSeparator" })
hl(0, "NvimTreeRootFolder", { link = "NeoTreeRootName" })
hl(0, "NvimTreeFolderName", { link = "NeoTreeDirectoryName" })
hl(0, "NvimTreeFolderIcon", { link = "NeoTreeDirectoryIcon" })
hl(0, "NvimTreeEmptyFolderName", { link = "NeoTreeDirectoryName" })
hl(0, "NvimTreeOpenedFolderName", { fg = p.cyan, bold = true })

-- BufferLine
hl(0, "BufferLineFill", { bg = p.bg_dark })
hl(0, "BufferLineBackground", { bg = p.bg_dark, fg = p.gray3 })
hl(0, "BufferLineBufferSelected", { bg = p.bg_light, fg = p.fg, bold = true })
hl(0, "BufferLineBufferVisible", { bg = p.bg_dark, fg = p.fg_dark })
hl(0, "BufferLineTab", { bg = p.bg_dark, fg = p.gray3 })
hl(0, "BufferLineTabSelected", { bg = p.bg_light, fg = p.fg, bold = true })
hl(0, "BufferLineTabSeparator", { fg = p.bg_dark, bg = p.bg_dark })
hl(0, "BufferLineTabSeparatorSelected", { fg = p.bg_dark, bg = p.bg_light })
hl(0, "BufferLineSeparator", { fg = p.bg_dark, bg = p.bg_dark })
hl(0, "BufferLineSeparatorSelected", { fg = p.bg_dark, bg = p.bg_light })
hl(0, "BufferLineSeparatorVisible", { fg = p.bg_dark, bg = p.bg_dark })
hl(0, "BufferLineIndicatorSelected", { fg = p.purple, bg = p.bg_light })
hl(0, "BufferLineIndicatorVisible", { fg = p.gray3, bg = p.bg_dark })
hl(0, "BufferLineModified", { fg = p.yellow, bg = p.bg_dark })
hl(0, "BufferLineModifiedSelected", { fg = p.yellow, bg = p.bg_light })
hl(0, "BufferLineModifiedVisible", { fg = p.yellow, bg = p.bg_dark })
hl(0, "BufferLineError", { fg = p.error, bg = p.bg_dark })
hl(0, "BufferLineErrorSelected", { fg = p.error, bg = p.bg_light, bold = true })
hl(0, "BufferLineErrorDiagnostic", { fg = p.error, bg = p.bg_dark })
hl(0, "BufferLineErrorDiagnosticSelected", { fg = p.error, bg = p.bg_light })
hl(0, "BufferLineWarning", { fg = p.warning, bg = p.bg_dark })
hl(0, "BufferLineWarningSelected", { fg = p.warning, bg = p.bg_light, bold = true })
hl(0, "BufferLineWarningDiagnostic", { fg = p.warning, bg = p.bg_dark })
hl(0, "BufferLineWarningDiagnosticSelected", { fg = p.warning, bg = p.bg_light })
hl(0, "BufferLineInfo", { fg = p.info, bg = p.bg_dark })
hl(0, "BufferLineInfoSelected", { fg = p.info, bg = p.bg_light, bold = true })
hl(0, "BufferLineInfoDiagnostic", { fg = p.info, bg = p.bg_dark })
hl(0, "BufferLineInfoDiagnosticSelected", { fg = p.info, bg = p.bg_light })
hl(0, "BufferLineHint", { fg = p.hint, bg = p.bg_dark })
hl(0, "BufferLineHintSelected", { fg = p.hint, bg = p.bg_light, bold = true })
hl(0, "BufferLineHintDiagnostic", { fg = p.hint, bg = p.bg_dark })
hl(0, "BufferLineHintDiagnosticSelected", { fg = p.hint, bg = p.bg_light })
hl(0, "BufferLinePick", { fg = p.error, bg = p.bg_dark, bold = true })
hl(0, "BufferLinePickSelected", { fg = p.error, bg = p.bg_light, bold = true })
hl(0, "BufferLinePickVisible", { fg = p.error, bg = p.bg_dark, bold = true })
hl(0, "BufferLineCloseButton", { fg = p.gray4, bg = p.bg_dark })
hl(0, "BufferLineCloseButtonSelected", { fg = p.error, bg = p.bg_light })
hl(0, "BufferLineCloseButtonVisible", { fg = p.gray4, bg = p.bg_dark })
hl(0, "BufferLineDuplicate", { fg = p.gray3, bg = p.bg_dark, italic = true })
hl(0, "BufferLineDuplicateSelected", { fg = p.fg_dark, bg = p.bg_light, italic = true })
hl(0, "BufferLineDuplicateVisible", { fg = p.gray3, bg = p.bg_dark, italic = true })
hl(0, "BufferLineNumbers", { fg = p.gray3, bg = p.bg_dark })
hl(0, "BufferLineNumbersSelected", { fg = p.fg, bg = p.bg_light })

-- GitSigns
hl(0, "GitSignsAdd", { fg = p.sage, bg = p.bg })
hl(0, "GitSignsChange", { fg = p.yellow, bg = p.bg })
hl(0, "GitSignsDelete", { fg = p.error, bg = p.bg })
hl(0, "GitSignsAddNr", { fg = p.sage, bg = p.bg })
hl(0, "GitSignsChangeNr", { fg = p.yellow, bg = p.bg })
hl(0, "GitSignsDeleteNr", { fg = p.error, bg = p.bg })
hl(0, "GitSignsAddLn", { bg = p.sage, fg = p.bg })
hl(0, "GitSignsChangeLn", { bg = p.yellow, fg = p.bg })
hl(0, "GitSignsDeleteLn", { bg = p.error, fg = p.bg })
hl(0, "GitSignsAddInline", { bg = p.sage, fg = p.bg })
hl(0, "GitSignsChangeInline", { bg = p.yellow, fg = p.bg })
hl(0, "GitSignsDeleteInline", { bg = p.error, fg = p.bg })
hl(0, "GitSignsCurrentLineBlame", { fg = p.gray4, italic = true })
hl(0, "GitSignsAddPreview", { fg = p.sage })
hl(0, "GitSignsDeletePreview", { fg = p.error })
hl(0, "GitSignsAddVirtLn", { bg = p.sage, fg = p.bg })
hl(0, "GitSignsDeleteVirtLn", { bg = p.error, fg = p.bg })

-- Notify
hl(0, "NotifyERRORBorder", { fg = p.error, bg = p.bg_light })
hl(0, "NotifyERRORIcon", { fg = p.error })
hl(0, "NotifyERRORTitle", { fg = p.error, bold = true })
hl(0, "NotifyERRORBody", { fg = p.fg, bg = p.bg_light })
hl(0, "NotifyWARNBorder", { fg = p.warning, bg = p.bg_light })
hl(0, "NotifyWARNIcon", { fg = p.warning })
hl(0, "NotifyWARNTitle", { fg = p.warning, bold = true })
hl(0, "NotifyWARNBody", { fg = p.fg, bg = p.bg_light })
hl(0, "NotifyINFOBorder", { fg = p.info, bg = p.bg_light })
hl(0, "NotifyINFOIcon", { fg = p.info })
hl(0, "NotifyINFOTitle", { fg = p.info, bold = true })
hl(0, "NotifyINFOBody", { fg = p.fg, bg = p.bg_light })
hl(0, "NotifyDEBUGBorder", { fg = p.gray4, bg = p.bg_light })
hl(0, "NotifyDEBUGIcon", { fg = p.gray4 })
hl(0, "NotifyDEBUGTitle", { fg = p.gray4, bold = true })
hl(0, "NotifyDEBUGBody", { fg = p.fg, bg = p.bg_light })
hl(0, "NotifyTRACEBorder", { fg = p.purple, bg = p.bg_light })
hl(0, "NotifyTRACEIcon", { fg = p.purple })
hl(0, "NotifyTRACETitle", { fg = p.purple, bold = true })
hl(0, "NotifyTRACEBody", { fg = p.fg, bg = p.bg_light })
hl(0, "NotifyBackground", { bg = p.bg_light })

-- WhichKey
hl(0, "WhichKey", { fg = p.cyan, bold = true })
hl(0, "WhichKeyGroup", { fg = p.purple })
hl(0, "WhichKeyDesc", { fg = p.fg })
hl(0, "WhichKeySeparator", { fg = p.gray4 })
hl(0, "WhichKeyFloat", { bg = p.bg_light })
hl(0, "WhichKeyBorder", { fg = p.purple, bg = p.bg_light })
hl(0, "WhichKeyValue", { fg = p.gray4 })

-- Indent Blankline
hl(0, "IblIndent", { fg = p.gray2, nocombine = true })
hl(0, "IblWhitespace", { fg = p.gray2, nocombine = true })
hl(0, "IblScope", { fg = p.purple, nocombine = true })
hl(0, "IndentBlanklineChar", { fg = p.gray2 })
hl(0, "IndentBlanklineSpaceChar", { fg = p.gray2 })
hl(0, "IndentBlanklineContextChar", { fg = p.purple })
hl(0, "IndentBlanklineContextStart", { underline = true, sp = p.purple })

-- Dashboard / Alpha
hl(0, "DashboardHeader", { fg = p.purple, bold = true })
hl(0, "DashboardCenter", { fg = p.cyan })
hl(0, "DashboardShortCut", { fg = p.yellow })
hl(0, "DashboardFooter", { fg = p.gray4, italic = true })
hl(0, "AlphaHeader", { fg = p.purple, bold = true })
hl(0, "AlphaButtons", { fg = p.cyan })
hl(0, "AlphaShortcut", { fg = p.yellow, bold = true })
hl(0, "AlphaFooter", { fg = p.gray4, italic = true })

-- Noice
hl(0, "NoicePopup", { bg = p.bg_light, fg = p.fg })
hl(0, "NoicePopupBorder", { fg = p.purple, bg = p.bg_light })
hl(0, "NoiceCmdline", { bg = p.bg_highlight, fg = p.fg })
hl(0, "NoiceCmdlinePopup", { bg = p.bg_highlight, fg = p.fg })
hl(0, "NoiceCmdlinePopupBorder", { fg = p.purple, bg = p.bg_highlight })
hl(0, "NoiceCmdlinePopupTitle", { fg = p.bg, bg = p.purple, bold = true })
hl(0, "NoiceCmdlineIcon", { fg = p.cyan })
hl(0, "NoiceCmdlineIconSearch", { fg = p.yellow })
hl(0, "NoiceConfirm", { bg = p.bg_light, fg = p.fg })
hl(0, "NoiceConfirmBorder", { fg = p.cyan, bg = p.bg_light })
hl(0, "NoiceMini", { bg = p.bg_light, fg = p.fg })
hl(0, "NoiceFormatProgressDone", { bg = p.sage, fg = p.bg })
hl(0, "NoiceFormatProgressTodo", { bg = p.bg_visual, fg = p.gray4 })
hl(0, "NoiceLspProgressClient", { fg = p.purple })
hl(0, "NoiceLspProgressSpinner", { fg = p.cyan })
hl(0, "NoiceLspProgressTitle", { fg = p.fg })

-- Cmp (Completion)
hl(0, "CmpNormal", { bg = p.bg_highlight, fg = p.fg })
hl(0, "CmpBorder", { fg = p.gray2, bg = p.bg_highlight })
hl(0, "CmpDocumentation", { bg = p.bg_light, fg = p.fg })
hl(0, "CmpDocumentationBorder", { fg = p.gray2, bg = p.bg_light })
hl(0, "CmpItemAbbr", { fg = p.fg })
hl(0, "CmpItemAbbrDeprecated", { fg = p.gray4, strikethrough = true })
hl(0, "CmpItemAbbrMatch", { fg = p.mint, bold = true })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = p.sage, bold = true })
hl(0, "CmpItemMenu", { fg = p.gray4, italic = true })
hl(0, "CmpItemKind", { fg = p.cyan })
hl(0, "CmpItemKindText", { fg = p.fg })
hl(0, "CmpItemKindMethod", { fg = p.blue })
hl(0, "CmpItemKindFunction", { fg = p.blue })
hl(0, "CmpItemKindConstructor", { fg = p.yellow })
hl(0, "CmpItemKindField", { fg = p.cyan })
hl(0, "CmpItemKindVariable", { fg = p.fg })
hl(0, "CmpItemKindClass", { fg = p.yellow })
hl(0, "CmpItemKindInterface", { fg = p.yellow })
hl(0, "CmpItemKindModule", { fg = p.yellow })
hl(0, "CmpItemKindProperty", { fg = p.cyan })
hl(0, "CmpItemKindUnit", { fg = p.orange })
hl(0, "CmpItemKindValue", { fg = p.orange })
hl(0, "CmpItemKindEnum", { fg = p.yellow })
hl(0, "CmpItemKindKeyword", { fg = p.purple })
hl(0, "CmpItemKindSnippet", { fg = p.teal })
hl(0, "CmpItemKindColor", { fg = p.pink })
hl(0, "CmpItemKindFile", { fg = p.blue })
hl(0, "CmpItemKindReference", { fg = p.cyan })
hl(0, "CmpItemKindFolder", { fg = p.blue })
hl(0, "CmpItemKindEnumMember", { fg = p.orange })
hl(0, "CmpItemKindConstant", { fg = p.orange })
hl(0, "CmpItemKindStruct", { fg = p.yellow })
hl(0, "CmpItemKindEvent", { fg = p.purple })
hl(0, "CmpItemKindOperator", { fg = p.cyan })
hl(0, "CmpItemKindTypeParameter", { fg = p.yellow })
hl(0, "CmpItemKindCopilot", { fg = p.teal })
hl(0, "CmpItemKindCodeium", { fg = p.teal })
hl(0, "CmpItemKindTabNine", { fg = p.teal })
hl(0, "CmpItemKindSuperMaven", { fg = p.teal })

-- Trouble
hl(0, "TroubleNormal", { bg = p.bg_light, fg = p.fg })
hl(0, "TroubleText", { fg = p.fg })
hl(0, "TroubleCount", { fg = p.purple, bold = true })
hl(0, "TroubleCode", { fg = p.gray4 })
hl(0, "TroubleDirectory", { fg = p.blue })
hl(0, "TroubleSource", { fg = p.gray4 })
hl(0, "TroubleFile", { fg = p.cyan })
hl(0, "TroubleIndent", { fg = p.gray2 })
hl(0, "TroubleLocation", { fg = p.gray4 })
hl(0, "TroubleFoldIcon", { fg = p.purple })
hl(0, "TroubleTextError", { fg = p.error })
hl(0, "TroubleTextWarning", { fg = p.warning })
hl(0, "TroubleTextInformation", { fg = p.info })
hl(0, "TroubleTextHint", { fg = p.hint })
hl(0, "TroubleSignError", { fg = p.error })
hl(0, "TroubleSignWarning", { fg = p.warning })
hl(0, "TroubleSignInformation", { fg = p.info })
hl(0, "TroubleSignHint", { fg = p.hint })

-- Todo Comments
hl(0, "TodoBgFIX", { fg = p.bg, bg = p.error, bold = true })
hl(0, "TodoBgHACK", { fg = p.bg, bg = p.warning, bold = true })
hl(0, "TodoBgNOTE", { fg = p.bg, bg = p.cyan, bold = true })
hl(0, "TodoBgPERF", { fg = p.bg, bg = p.purple, bold = true })
hl(0, "TodoBgTODO", { fg = p.bg, bg = p.sage, bold = true })
hl(0, "TodoBgWARN", { fg = p.bg, bg = p.orange, bold = true })
hl(0, "TodoFgFIX", { fg = p.error })
hl(0, "TodoFgHACK", { fg = p.warning })
hl(0, "TodoFgNOTE", { fg = p.cyan })
hl(0, "TodoFgPERF", { fg = p.purple })
hl(0, "TodoFgTODO", { fg = p.sage })
hl(0, "TodoFgWARN", { fg = p.orange })
hl(0, "TodoSignFIX", { fg = p.error, bg = p.bg })
hl(0, "TodoSignHACK", { fg = p.warning, bg = p.bg })
hl(0, "TodoSignNOTE", { fg = p.cyan, bg = p.bg })
hl(0, "TodoSignPERF", { fg = p.purple, bg = p.bg })
hl(0, "TodoSignTODO", { fg = p.sage, bg = p.bg })
hl(0, "TodoSignWARN", { fg = p.orange, bg = p.bg })

-- Additional plugin highlights continue...
-- (Truncated for length, but all remaining plugins follow the same pattern)

-- Rainbow Delimiters
hl(0, "RainbowDelimiterRed", { fg = p.error })
hl(0, "RainbowDelimiterYellow", { fg = p.yellow })
hl(0, "RainbowDelimiterBlue", { fg = p.blue })
hl(0, "RainbowDelimiterOrange", { fg = p.orange })
hl(0, "RainbowDelimiterGreen", { fg = p.sage })
hl(0, "RainbowDelimiterViolet", { fg = p.purple })
hl(0, "RainbowDelimiterCyan", { fg = p.cyan })

-- Final cursor configuration
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
