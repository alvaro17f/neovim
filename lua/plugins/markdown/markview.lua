vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" }, { load = true, confirm = false })

require("markview").setup({
  ft = vim.g.markdown_filetypes,
  opts = {
    preview = {
      filetypes = vim.g.markdown_filetypes,
      ignore_buftypes = {},
    },
  },
})
