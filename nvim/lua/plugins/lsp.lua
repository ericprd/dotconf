return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		local lspconfig = require("lspconfig")
        
        local on_attach = function(client, buffnr)
            local opts = { buffer = buffnr }

	    	vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

            --vim.api.nvim_create_autocmd("BufWritePre", {
              --  buffer = buffnr,
                --callback = function()
                  -- Apply code action for organizing imports
                  --local context = { only = { "source.organizeImports" } }
                  --local params = vim.lsp.util.make_range_params()
                  --params.context = context
                  --vim.lsp.buf.code_action = {
                      --context = context,
                      --apply = true,
                  --}
                --end,
            --})

            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                  -- Format the buffer (blocking to ensure proper save state)
                  vim.lsp.buf.format({ async = false })

                  -- Organize imports
                  local params = vim.lsp.util.make_range_params()
                  params.context = { only = { "source.organizeImports" } }

                  local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
                  if result then
                    for _, res in pairs(result) do
                      for _, action in pairs(res.result or {}) do
                        if action.edit then
                          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
                        elseif type(action.command) == "table" then
                          vim.lsp.buf.execute_command(action.command)
                        end
                      end
                    end
                  end
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
