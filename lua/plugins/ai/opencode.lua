vim.pack.add({ "https://github.com/NickvanDyke/opencode.nvim" }, { load = true, confirm = false })

require("opencode").setup({
	provider_id = "openrouter",
	model_id = vim.env.OPENROUTER_MODEL,
	port = nil,
	auto_reload = true,
	terminal = {
		win = {
			enter = true,
			position = "right",
		},
	},
})

-- stylua: ignore start
  vim.keymap.set({"n", "t"}, '<C-/>', function() require('opencode').toggle() end, {desc = 'Toggle embedded opencode'})
  vim.keymap.set({"n", "v"}, '<leader>oa', function() require('opencode').ask() end, {desc = 'Ask opencode'})
  vim.keymap.set({"n", "v"}, '<leader>oA', function() require('opencode').ask('@file ') end, {desc = 'Ask opencode about current file'})
  vim.keymap.set("n", '<leader>on', function() require('opencode').create_session() end, {desc = 'New session'})
  vim.keymap.set("n", '<leader>oe', function() require('opencode').prompt('Explain @cursor and its context') end, {desc = 'Explain code near cursor'} )
  vim.keymap.set("n", '<leader>or', function() require('opencode').prompt('Review @file for correctness and readability') end, {desc = 'Review file'})
  vim.keymap.set("n", '<leader>of', function() require('opencode').prompt('Fix these @diagnostics') end, {desc = 'Fix errors'})
  vim.keymap.set("v", '<leader>oo', function() require('opencode').prompt('Optimize @selection for performance and readability') end, {desc = 'Optimize selection'})
  vim.keymap.set("v", '<leader>od', function() require('opencode').prompt('Add documentation comments for @selection') end, {desc = 'Document selection' })
  vim.keymap.set("v", '<leader>ot', function() require('opencode').prompt('Add tests for @selection') end, {desc = 'Test selection'})
-- stylua: ignore end
