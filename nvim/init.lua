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
    end
  end
})


