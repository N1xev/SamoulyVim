return {
  "vyfor/cord.nvim",
  lazy = false,
  build = ":Cord update",
  config = function()
    --FIX: Buttons are not showing
    require("cord").setup({
      editor = {
        client = "neovim",
        tooltip = "SamoulyVim - The Superior Text Editor",
      },
      display = {
        theme = "catppuccin",
        flavor = "accent",
      },
      buttons = {
        {
          label = "Website",
          url = "https://samouly.is-a.dev",
        },
      },
    })
  end,
}
