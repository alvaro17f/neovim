require("vim._extui").enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = {
    ---@type 'cmd'|'msg'
    target = "msg",
    timeout = 4000,
  },
})

require("core.flags")
require("core.autocmd")
require("core.options")
require("core.keymaps")
