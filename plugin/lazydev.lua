vim.pack.add({ "https://github.com/folke/lazydev.nvim" }, { load = true, confirm = false })

require("lazydev").setup({
	ft = { "lua" },
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			{ path = "snacks.nvim", words = { "Snacks" } },
		},
	},
})
