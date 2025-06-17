return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }},
    config = function()
        require("telescope").setup()

        local telescopebi = require("telescope.builtin")

        vim.keymap.set("n", "<LEADER>fd", telescopebi.find_files, {
            desc = "Find files"
        })
        vim.keymap.set("n", "<LEADER>gf", telescopebi.live_grep, {
            desc = "Global search"
        })
        vim.keymap.set("n", "gr", telescopebi.lsp_references, {
            desc = "Go to references (with picker)"
        })
    end
}
