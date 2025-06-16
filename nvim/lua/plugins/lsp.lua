return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.gopls.setup({})

		-- diagnostics
		vim.diagnostic.config({ float = { border = "rounded" } })
	end,
}
