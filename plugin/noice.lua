-- https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#showmode
vim.pack.add({
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
}, { load = true, confirm = false })

require("noice").setup({
	preset = {
		bottom_search = true,
		command_palette = true,
		lsp_doc_border = true,
	},
	cmdline = {
		view = "cmdline",
		format = {
			search_down = {
				view = "cmdline",
			},
			search_up = {
				view = "cmdline",
			},
		},
	},

	lsp = {
		hover = {
			enabled = true,
			view = "hover",
			border = {
				style = "rounded",
			},
		},
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
		signature = {
			enabled = false, -- provided by blink.cmp
		},
	},
	views = {
		hover = {
			border = {
				style = "rounded",
			},
			position = { row = 2, col = 2 },
		},
	},
})

vim.keymap.set("n", "<leader>nm", "<CMD>messages<CR>", { desc = "Show messages" })
