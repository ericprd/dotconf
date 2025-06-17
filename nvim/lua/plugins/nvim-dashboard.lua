return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  lazy = false,
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          "Welcome to Neovim",
          "🚀 Fast. Minimal. Powerful.",
        },
        shortcut = {
          { desc = "󰊳 Update Plugins", group = "@property", action = "Lazy update", key = "u" },
          { desc = " Find File", group = "@function", action = "Telescope find_files", key = "f" },
        },
      },
    })
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" }
}

