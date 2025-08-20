vim.pack.add({ "https://github.com/folke/snacks.nvim" }, { load = true, confirm = false })

local Snacks = require("snacks")

local opts = require("utils.snacks").get_config()
Snacks.setup(opts)

require("utils.snacks").load_keymaps()
