-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  ["@comment"] = { italic = true },
  Search = { fg = "black", bg = "blue" },
  IncSearch = { fg = "black", bg = "red" },
  CurSearch = { fg = "black", bg = "blue" },
  Substitute = { fg = "black", bg = "green" },
  FoldColumn = { bg = "NONE" },
  LspReferenceRead = { link = "Underlined" },
  LspReferenceText = { link = "Underlined" },
  LspReferenceWrite = { link = "Underlined" },
  TbFill = { link = "Normal", bg = "white" },
  NvimTreeRootFolder = { link = "NvimTreeFolderName", fg = "sun" },
  NvimTreeOpenedFolderName = { fg = "seablue" },
  NvimTreeFolderName = { fg = "cyan" },
  NvimTreeFolderIcon = { fg = "yellow" },
  NvimTreeWinSeparator = { fg = "statusline_bg" },
  NvDashAscii = { fg = "sun" },
  NvDashButtons = { fg = "red" },
}

---@type HLTable
M.add = {
  WinBar = { fg = "foregroundColor", bg = "backgroundColor" },
  WinBarNC = { fg = "grey_fg", bg = "backgroundColor" },
  WinSeparator = { fg = "statusline_bg" },
  VertSplit = { fg = "statusline_bg" },
  DiffviewDiffAdd = { fg = "black", bg = "vibrant_green" },
  DiffviewDiffChange = { fg = "black", bg = "yellow" },
  DiffviewDiffDelete = { fg = "black", bg = "red" },
  DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
  LspInlayHint = { fg = "infoForeground", italic = true },
  CursorLine = { bg = "selectionBackground" },
  Visual = { bg = "selectionBackground" },
  NotifyBackground = { bg = "black" },

  SnacksNormal = { bg = "darker_black" },
  SnacksPickerPreviewTitle = {
    fg = "black",
    bg = "green",
  },
  SnacksTitle = {
    fg = "black",
    bg = "red",
  },
  SnacksPickerSelected = { bg = "darker_black", fg = "green" },
  SnacksPickerMatch = { bg = "one_bg", fg = "blue" },
  SnacksPickerBorder = { fg = "darker_black", bg = "darker_black" },
  SnacksPickerDir = { fg = "white" },
}

return M
