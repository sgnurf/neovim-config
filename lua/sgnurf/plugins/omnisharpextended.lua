return {
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    config = function ()
      local oel = require("omnisharp_extended")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "cs",
        callback = function (evt)
          vim.keymap.set("n", "<leader>gd", function ()
            oel.telescope_lsp_definitions()
          end, { buffer = evt.buf, desc = "Go to definition" })
        end,
      })
    end
  }
}
