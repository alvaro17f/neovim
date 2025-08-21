vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, { load = true, confirm = false })

require("render-markdown").setup({
  ft = vim.g.markdown_filetypes,
  opts = {
    anti_conceal = { enabled = false },
    file_types = vim.g.markdown_filetypes,
  },
})
