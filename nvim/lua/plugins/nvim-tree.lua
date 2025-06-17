return {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	config = function()
		require("nvim-tree").setup()
	end,
}
