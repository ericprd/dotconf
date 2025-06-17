return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- tag = "v1.x.x",
  config = function()
    -- Enable mouse in tabline
    vim.o.mouse = "a"

    -- Optional: enable barbar
    -- require("bufferline").setup{
      -- animation = true,
      -- icons = { filetype = { enable = true } },
      -- closable = true,
    -- }

    -- Keybindings
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true, desc = '' }

    -- Move to previous/next buffer
    map("n", "<Space>h", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
    map("n", "<Space>l", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
    map("n", "<Space>q", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })
    map("n", "<Space>p", "<Cmd>BufferPick<CR>", { desc = "Pick buffer" })
    map("n", "<Space>1", "<Cmd>BufferGoto 1<CR>", { desc = "Go to buffer 1" })
    map("n", "<Space>2", "<Cmd>BufferGoto 2<CR>", { desc = "Go to buffer 2" })
    map("n", "<Space>3", "<Cmd>BufferGoto 3<CR>", { desc = "Go to buffer 3" })
    map("n", "<Space>4", "<Cmd>BufferGoto 4<CR>", { desc = "Go to buffer 4" })
    map("n", "<Space>5", "<Cmd>BufferGoto 5<CR>", { desc = "Go to buffer 5" })
    -- …and so on
  end,
}
