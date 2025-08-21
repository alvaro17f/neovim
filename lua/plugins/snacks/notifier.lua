local M = {}

M.config = {
  notifier = {
    enabled = true,
    top_down = false,
    style = "minimal", -- "compact" | "fancy" | "minimal"
  },
  notify = { enabled = true },
}

M.keymaps = {
  vim.keymap.set("n", "<leader>nn", function()
    Snacks.notifier.show_history()
  end, { desc = "Notification history" }),

  vim.keymap.set("n", "<leader>nd", function()
    Snacks.notifier.hide()
  end, { desc = "Hide notifications" }),
}

return M
