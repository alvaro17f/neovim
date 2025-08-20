vim.pack.add({ "https://github.com/vague2k/vague.nvim" }, { load = true, confirm = false })

require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
