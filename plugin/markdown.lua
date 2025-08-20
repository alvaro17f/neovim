local filetypes = {
	"markdown",
}

local plugins = {
	markview = {
		vim.pack.add({ "https://github.com/OXY2DEV/markview.nvim" }, { load = true, confirm = false }),
		require("markview").setup({
			ft = filetypes,
			opts = {
				preview = {
					filetypes = filetypes,
					ignore_buftypes = {},
				},
			},
		}),
	},

	render_markdown = {
		vim.pack.add(
			{ "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
			{ load = true, confirm = false }
		),
		require("render-markdown").setup({
			ft = filetypes,
			opts = {
				anti_conceal = { enabled = false },
				file_types = filetypes,
			},
		}),
	},
}

return plugins.render_markdown
