local M = {}

M.config = {
	explorer = {
		replace_netrw = false,
	},
	picker = {
		sources = {
			explorer = {
				auto_close = true,
				hidden = true,
				win = {
					input = {
						keys = {
							["<Esc>"] = false,
						},
					},
					list = {
						keys = {
							["<Esc>"] = false,
						},
					},
				},
			},
		},
	},
}

return M
