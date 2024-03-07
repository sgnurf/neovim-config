return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end, { desc = "Toggle trouble" })

            vim.keymap.set("n", "<leader>ttn", function()
                require("trouble").next({skip_groups = true, jump = true});
            end, { desc = "Next trouble" })

            vim.keymap.set("n", "<leader>ttp", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end, { desc = "Previous trouble" })

        end
    },
}
