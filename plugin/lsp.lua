vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" }, { load = true, confirm = false })

local lsp_utils = require("utils.lsp")

lsp_utils.enable_servers()
