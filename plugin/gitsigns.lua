vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" }, { load = true, confirm = false })

local icons = {
  add = { text = "+" },
  change = { text = "~" },
  delete = { text = "_" },
  topdelete = { text = "‾" },
  changedelete = { text = "~" },
}

require("gitsigns").setup({
  preview_config = { border = "rounded" },
  current_line_blame = true,
  sign_priority = 0,
  signs = icons,
  signs_staged = icons,
})

vim.keymap.set("n", "<leader>g;", function()
  require("gitsigns").preview_hunk_inline()
end, { desc = "Preview hunk inline" })

vim.keymap.set("n", "[g", function()
  require("gitsigns").nav_hunk("prev", { target = "all" })
end, { desc = "Previous hunk" })

vim.keymap.set("n", "]g", function()
  require("gitsigns").nav_hunk("next", { target = "all" })
end, { desc = "Next hunk" })

vim.keymap.set("n", "<leader>gb", function()
  require("gitsigns").blame_line()
end, { desc = "Blame line" })
