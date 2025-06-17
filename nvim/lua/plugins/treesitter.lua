return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "go" },
			highlight = { enable = true },
			imcremental_selection = { enable = true },
		}
	end,
}
