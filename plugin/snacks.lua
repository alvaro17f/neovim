vim.pack.add({ "https://github.com/folke/snacks.nvim" }, { load = true, confirm = false })

local Snacks = require("snacks")
local utils = require("utils")

local snacks_path = vim.fn.stdpath("config") .. "/lua/plugins/snacks/"

local opts = utils.get_config(snacks_path)

Snacks.setup(opts)

utils.load_keymaps(snacks_path)
