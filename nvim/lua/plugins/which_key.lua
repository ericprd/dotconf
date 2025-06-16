return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup()

		vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
	end,
}
