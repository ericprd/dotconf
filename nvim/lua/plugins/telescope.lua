--[[return {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }},
    config = function()
        require("telescope").setup()

        local telescopebi = require("telescope.builtin")

        vim.keymap.set("n", "<LEADER>fd", telescopebi.find_files, {
            desc = "Find files"
        })
        vim.keymap.set("n", "<LEADER>gf", telescopebi.live_grep, {
            desc = "Global search"
        })
        vim.keymap.set("n", "<LEADER>fc", telescopebi.commands, { 
            desc = "Commands" 
        })
        vim.keymap.set("n", "gr", telescopebi.lsp_references, {
            desc = "Go to references (with picker)"
        })
    end
}--]]

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
    },
  },
  config = function()
    local telescope = require("telescope")
    local telescope_builtin = require("telescope.builtin")

    telescope.setup({
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- Insert mode mappings (optional)
            },
            ["n"] = {
              ["a"] = function(prompt_bufnr)
                -- Create new file
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                local current_picker = action_state.get_current_picker(prompt_bufnr)
                local input = vim.trim(current_picker:_get_prompt())

                if input == "" then
                  print("Please enter a file name")
                  return
                end

                actions.close(prompt_bufnr)
                vim.cmd("edit " .. input)
              end,
              ["A"] = function(prompt_bufnr)
                -- Create new directory
                local action_state = require("telescope.actions.state")
                local actions = require("telescope.actions")

                local current_picker = action_state.get_current_picker(prompt_bufnr)
                local input = vim.trim(current_picker:_get_prompt())

                if input == "" then
                  print("Please enter a directory name")
                  return
                end

                actions.close(prompt_bufnr)
                vim.fn.mkdir(input, "p")
                vim.cmd("edit " .. input .. "/.gitkeep")
              end,
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    vim.keymap.set("n", "<LEADER>fd", telescope_builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<LEADER>gf", telescope_builtin.live_grep, { desc = "Global search" })
    vim.keymap.set("n", "gr", telescope_builtin.lsp_references, { desc = "Go to references (with picker)" })

    -- File browser keymap
    vim.keymap.set("n", "<LEADER>fb", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        initial_mode = "normal",
      })
    end, { noremap = true, silent = true, desc = "File Browser" })
  end,
}


