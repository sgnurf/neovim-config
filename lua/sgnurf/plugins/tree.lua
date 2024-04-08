return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      hijack_netrw = false,
      view = {
        centralize_selection = true,
        float = {
          enable = true,
        }
      }
    }
  end,
}
