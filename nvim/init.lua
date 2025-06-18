require("config.lazy")
require("config.options")

-- only show alpha when no files or directories are opened
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local is_dir = vim.fn.isdirectory(vim.fn.argv()[1] or "") == 1
    if is_dir then
      vim.cmd("cd " .. vim.fn.argv()[1])
      -- Clear args so alpha shows
      vim.cmd("silent! args")
      require("alpha").start()
 --     require("alpha").setup(require("alpha.themes.dashboard").config)
    end
  end
})

-- Disable barbar when in Alpha dashboard
vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    vim.opt.showtabline = 0
  end,
})

-- Show tabline again when opening a real file or directory
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function()
    -- Only show if not a dashboard
    if vim.bo.filetype ~= "alpha" then
      vim.opt.showtabline = 2
    end
  end,
})

-- Auto-close netrw after opening a file
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local buf = args.buf
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" or vim.fn.isdirectory(name) == 1 then
      vim.bo[buf].buflisted = false
    end
  end,
})



