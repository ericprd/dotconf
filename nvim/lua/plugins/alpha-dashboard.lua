return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "      Neovim Dashboard",
      "",
      "Go Developer IDE",
      "",
    }

    -- Set menus
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", "<Cmd>enew<CR>"),
      dashboard.button("f", "  Find File", "<Cmd>Telescope find_files<CR>"),
      dashboard.button("r", "  Recent File", "<Cmd>Telescope oldfiles<CR>"),
      dashboard.button("q", "雷  Quit", "<Cmd>quit<CR>"),
    }

    alpha.setup(dashboard.config)

    -- Auto-open Dashboard when starting with directory
--    vim.api.nvim_create_autocmd("VimEnter", {
  --    callback = function()
    --    if #vim.fn.argv() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
            -- If we opened with a directory
      --      vim.cmd("cd " .. vim.fn.argv()[1])  -- Change directory first
        --    vim.cmd("enew")  -- Open a new buffer
          --  require("alpha").start(true)
      --  end
    --  end,
    --  desc = "Open Dashboard instead of directory picker.",
--   })
  end,
}

