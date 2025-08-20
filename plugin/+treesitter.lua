vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" }, -- WARN: 'main' branch will become the default in the future
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
}, { load = true, confirm = false })

vim.api.nvim_create_autocmd({ "PackChanged" }, {
	group = vim.api.nvim_create_augroup("TreesitterUpdated", { clear = true }),
	callback = function(event)
		if event.data.spec.name == "nvim-treesitter" and event.data.kind == "update" then
			vim.schedule(function()
				vim.cmd("TSUpdate")
			end)
		end
	end,
})

local treesitter = require("nvim-treesitter.configs")
local autotag = require("nvim-ts-autotag")
local context = require("treesitter-context")

treesitter.setup({
	auto_install = true,
	ensure_installed = { "regex" },
	highlight = { enable = true },
	indent = { enable = true },
})

context.setup({
	enable = true,
	mode = "cursor", -- 'cursor' 'topline'
	max_lines = 3,
})

autotag.setup({
	opts = {
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
})
