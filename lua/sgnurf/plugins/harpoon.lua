return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Add current file to harpoon" })
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon menu" })

        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(1) end, { desc = "Go to first harpooned file" })
        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end, { desc = "Go to second harpooned file" })
        vim.keymap.set("n", "<C-r>", function() harpoon:list():select(3) end, { desc = "Go to third harpooned file" })
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(4) end, { desc = "Go to fourth harpooned file" })
    end
}
