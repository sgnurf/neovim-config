return {
  'echasnovski/mini.nvim',
  config = function()
    local ms = require('mini.surround')

    ms.setup()

    vim.keymap.set('n','yss',
    function()
      --Was not able to get a call to `MiniSurround.add()` to work so using hacky feedkey instead
      vim.api.nvim_feedkeys('saiw', 't', true)
    end, { desc = 'Surround word', silent = true, noremap = true }
    )
  end,
}
