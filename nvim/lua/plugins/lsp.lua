return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
        
        local on_attach = function(client, buffnr)
            local opts = { buffer = buffnr }

	    	vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--            vim.keymap.set("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
--
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = buffnr,
                callback = function()
                  -- Apply code action for organizing imports
                  local context = { only = { "source.organizeImports" } }
                  local params = vim.lsp.util.make_range_params()
                  params.context = context
                  vim.lsp.buf.code_action = {
                      context = context,
                      apply = true,
                  }
                end,
            })
        end

		lspconfig.gopls.setup({ on_attach = on_attach })

		-- diagnostics
		vim.diagnostic.config({ 
            float = { border = "rounded" },
            virtual_text = true,
            signs = true,
            underline = true,
        })

        vim.keymap.set("n", "<Space>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

	end,
}
