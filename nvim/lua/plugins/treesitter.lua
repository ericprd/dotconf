return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			highlight = { enable = true },
			imcremental_selection = { enable = true },
		}
	end,
}
