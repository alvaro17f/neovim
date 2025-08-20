vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" }, { load = true, confirm = false })

local fzf = require("fzf-lua")
local actions = fzf.actions

fzf.setup({
	hls = { normal = "Pmenu" },
	winopts = {
		height = 0.5,
		width = 0.8,
		row = 0.5,
		border = "none",
	},
	fzf_opts = {
		["--no-info"] = "",
		["--info"] = "hidden",
		["--padding"] = "13%,5%,13%,5%",
		["--header"] = " ",
		["--no-scrollbar"] = "",
	},
	defaults = {
		formatter = "path.filename_first",
	},
	buffers = {
		prompt = "buffers: ",
		no_header = true,
		fzf_opts = { ["--delimiter"] = " ", ["--with-nth"] = "-1.." },
		actions = {
			["ctrl-c"] = { fn = actions.buf_del, reload = true },
			["ctrl-x"] = false,
		},
	},
	git = {
		files = {
			prompt = "📂: ",
		},
	},
	grep = {
		prompt = " 🔍: ",
	},
	helptags = {
		prompt = "💡:",
		winopts = {
			width = 0.8,
			height = 0.7,
			preview = {
				layout = "horizontal",
				horizontal = "up:75%",
			},
		},
	},
	lsp = {
		code_actions = {
			prompt = "code actions: ",
			winopts = {
				width = 0.8,
				height = 0.7,
				preview = {
					layout = "horizontal",
					horizontal = "up:75%",
				},
			},
		},
	},
	oldfiles = {
		prompt = "⌛: ",
	},
	keymap = {
		builtin = {
			["<Esc>"] = "hide",
			["<c-d>"] = "preview-down",
			["<c-u>"] = "preview-up",
		},
		fzf = {
			["ctrl-q"] = "select-all+accept",
		},
	},
})

fzf.register_ui_select()

vim.keymap.set("n", "<leader>ff", function()
	if require("utils.git").is_git_repo() then
		return require("fzf-lua").git_files()
	end
	require("fzf-lua").files()
end, { desc = "Find Files" })

vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep({ cwd = require("utils.git").get_workspace_root() })
end, { desc = "Grep Files" })

vim.keymap.set("n", "<leader>fr", function()
	require("fzf-lua").oldfiles()
end, { desc = "Recent Files" })

vim.keymap.set("n", "<leader><leader>", function()
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })
	if #buffers >= 2 then
		require("fzf-lua").buffers()
	else
		print("Not enough buffers to show")
	end
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fb", function()
	local bufs = vim.api.nvim_list_bufs()
	local qflist = {}
	for _, buf in ipairs(bufs) do
		table.insert(qflist, { bufnr = buf })
	end
	vim.fn.setqflist(qflist, "r")
	require("fzf-lua").grep_quickfix()
end, { desc = "Grep Buffers" })

vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").helptags()
end, { desc = "Search Help Tags" })

vim.keymap.set("n", "<leader>cc", function()
	require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Search Config" })

vim.keymap.set("n", "<leader>f<backspace>", function()
	require("fzf-lua").resume()
end, { desc = "Resume Picker" })
