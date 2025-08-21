vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/folke/todo-comments.nvim",
}, { load = true, confirm = false })

vim.keymap.set("n", "<leader>ft", function()
  Snacks.picker.todo_comments()
end, { desc = "show TODO" })
