local utils = require("utils")

local mini_path = vim.fn.stdpath("config") .. "/lua/plugins/mini/"

utils.require_modules(mini_path)
