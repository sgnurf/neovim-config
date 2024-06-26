vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex, {desc = "View project files"})
vim.keymap.set("n","<C-d>", "<C-d>zz", {desc = "Scroll down half page"})
vim.keymap.set("n","<C-u>", "<C-u>zz", {desc = "Scroll up half page"})
vim.keymap.set("n","n", "nzz", {desc = "Move to next search result"})
vim.keymap.set("n","N", "Nzz", {desc = "Move to previous search result"})
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Paste without overwriting clipboard"})
vim.keymap.set("n","<leader>o", "o<ESC>", {desc = "Insert new line below and enter insert mode"})
vim.keymap.set("n","<leader>O", "O<ESC>", {desc = "Insert new line above and enter insert mode"})
vim.keymap.set("n",",", vim.cmd.redo, {desc = "Redo"})
vim.keymap.set("n","<C-j>", "<cmd>cnext<CR>zz", {desc = "Go to next quickfix item"})
vim.keymap.set("n","<C-k>", "<cmd>cprev<CR>zz", {desc = "Go to previous quickfix item"})

-- Disable search highlighting when pressing enter
vim.keymap.set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    return ""
  else
    return "<CR>"
  end
end, { expr = true })
