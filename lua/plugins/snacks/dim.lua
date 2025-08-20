local M = {}

M.config = {
	dim = { enabled = true },
}

M.keymaps = {
	vim.keymap.set("n", "<leader>d", function()
		require("snacks").dim()
	end, { desc = "Toggle Dim" }),
}

return M
