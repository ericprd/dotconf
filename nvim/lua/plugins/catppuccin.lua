return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = false,
            term_colors = true,
            integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
            },
                telescope = true,
            },
        })
		vim.cmd.colorscheme "catppuccin"
	end
}

