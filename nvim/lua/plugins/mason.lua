return {
	"williamboman/mason.nvim",
	dependencies = {
    		"williamboman/mason-lspconfig.nvim",
    		"WhoIsSethDaniel/mason-tool-installer.nvim",
  	},
  	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
	end,
}
