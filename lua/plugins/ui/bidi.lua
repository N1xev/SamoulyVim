-- في ~/.config/nvim/lua/plugins/bidi.lua
return {
  "mcookly/bidi.nvim",
  event = "VeryLazy", -- ضيف ده عشان يتحمل بدري
  config = function()
    require("bidi").setup()
  end,
}
