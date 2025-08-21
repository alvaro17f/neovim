------------------------------------
-- UNDOFILE ON GIT REPOSITORY ONLY
------------------------------------
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  callback = function()
    vim.o.undofile = require("utils.git").is_git_repo()
  end,
})

------------------------------------
-- HIGHLIGHT ON YANK
------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 100 })
  end,
})

------------------------------------
-- WINBAR
------------------------------------
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "" then
      return
    end

    vim.o.winbar = "%=" .. "%{%v:lua.require('utils.winbar').winbar_get_icon()%}" .. "  " .. "%F" .. " " .. "%m"
  end,
})
