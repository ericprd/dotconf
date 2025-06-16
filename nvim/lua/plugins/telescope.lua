return {
	"nvim-telescope/telescope.nvim",
	dependencies = { 
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
	config = function()
		require("telescope").setup()

        vim.keymap.set("n", "<LEADER>fd", require("telescope.builtin").find_files)
	end,
}
