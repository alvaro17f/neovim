-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" }, { load = true, confirm = false })

local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "auto", -- "auto", "horizon", "catppuccin"
    component_separators = "",
    section_separators = { left = "", right = "" },
    globalstatus = false,
    disabled_filetypes = {
      statusline = {
        "grug-far",
        "lazy",
        "lazydo",
        "lazygit",
        "mason",
        "minifiles",
        "snacks_dashboard",
        "snacks_picker_input",
        "snacks_terminal",
        "yazi",
      },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          hint = " ",
          info = " ",
        },
      },
      {
        "filename",
        path = 3,
      },
    },
    lualine_x = {
      {
        "diff",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      },
      "filetype",
      {
        "macro",
        fmt = function()
          local reg = vim.fn.reg_recording()
          if reg ~= "" then
            return "Recording @" .. reg
          end
          return nil
        end,
        color = { fg = "#ff9e64" },
        draw_empty = false,
      },
    },
    lualine_y = { "encoding" },
    lualine_z = { "progress", "location" },
  },
})
