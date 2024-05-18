return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup {
        default_file_explorer = false,
        view_options = {
          show_hidden = true,
        }
      }

      vim.keymap.set("n", "<leader>o", function() oil.open() end, { desc = "Open oil for current directory"})
    end,
  },
}
