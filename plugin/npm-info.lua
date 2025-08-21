vim.pack.add({ "https://github.com/pxnditxyr/npm-info.nvim" }, { load = true, confirm = false })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "package.json",
  callback = function()
    require("npm-info").setup()
  end,
})
