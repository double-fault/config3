-- TODO: fast j, k
-- TODO: permanent undo
-- TODO: block cursor in insert mode ffs

require("core")
require("config.lazy")

-- NOTE: Keep this at the end, otherwise when loading plugins they sometimes rewrite the keymaps?
require("keymaps")
