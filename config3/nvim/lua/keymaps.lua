-- Use <leader>sk followed by a search for "keymaps" to look at all the keymaps in here
-- Reload neovim config with <leader>rc
vim.keymap.set("n", "<C-g>", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer (keymaps)" })
vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus file explorer (keymaps)" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[y]ank to system clipboard (keymaps)" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "[Y]ank current line to system clipboard (keymaps)" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "[P]aste from system clipboard (keymaps)" })

-- blink.cmp keymaps are mostly defaults, see plugins/blink.lua (https://cmp.saghen.dev/configuration/keymap.html#default)
-- Ctrl+Space has been remapped to Ctrl + s

-- <leader>xx for trouble.nvim toggle

--
-- LSP keymaps

vim.keymap.set("n", ";f", vim.lsp.buf.format, { desc = "LSP Format buffer (keymaps)" })
vim.keymap.set("n", ";n", vim.lsp.buf.rename, { desc = "LSP Rename (keymaps)" })
vim.keymap.set("n", ";h", "<cmd>LspClangdSwitchSourceHeader<CR>", { desc = "LSP Switch source/header (keymaps)" })
vim.keymap.set("n", ";v", function()
	vim.cmd("vsplit")
	vim.cmd("LspClangdSwitchSourceHeader")
end, { desc = "LSP Switch source/header in new vertical split (keymaps)" })
vim.keymap.set("n", ";a", vim.lsp.buf.code_action, { desc = "LSP Code actions (keymaps)" })
vim.keymap.set("n", ";r", require("telescope.builtin").lsp_references, { desc = "LSP references (keymaps)" })
vim.keymap.set("n", ";i", require("telescope.builtin").lsp_implementations, { desc = "LSP implementation (keymaps)" })
vim.keymap.set("n", ";d", require("telescope.builtin").lsp_definitions, { desc = "LSP definitions (keymaps)" })
vim.keymap.set("n", ";D", vim.lsp.buf.declaration, { desc = "LSP declaration (keymaps)" })
vim.keymap.set(
	"n",
	";0",
	require("telescope.builtin").lsp_document_symbols,
	{ desc = "LSP Open document symbols (keymaps)" }
)
vim.keymap.set(
	"n",
	";w",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "LSP Open workspace symbols (keymaps)" }
)
vim.keymap.set("n", ";t", require("telescope.builtin").lsp_type_definitions, { desc = "LSP type definition (keymaps)" })
vim.keymap.set("n", ";x", "<cmd>close<CR>", { desc = "Close split (keymaps)" })
vim.keymap.set("n", ";z", "<cmd>bd<CR>", { desc = "Close buffer (keymaps)" })
vim.keymap.set("n", ";c", "<C-W>x", { desc = "Rotate windows (split?) (keymaps)" })
vim.keymap.set("n", ";q", "<cmd>TodoTelescope<CR>", { desc = "Open todo list (keymaps) " })

--
-- Telescope keymaps
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps (keymaps)" })

vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "[F]ind [F]iles (keymaps)" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "[G]rep (keymaps)" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers (keymaps)" })

vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim config (keymaps)" })

vim.keymap.set("n", "<leader>sa", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") .. "/../alacritty" })
end, { desc = "[S]earch [A]lacritty config (keymaps)" })

vim.keymap.set("n", "<leader>st", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") .. "/../tmux" })
end, { desc = "[S]earch [T]mux config (keymaps)" })

--
-- vim tmux navigator

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<cr>")

--
-- tabby.nvim keymaps
vim.keymap.set("n", "<C-t>", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<C-x>", ":tabclose<CR>", { noremap = true })

vim.keymap.set("n", "<C-\\>", ":tabn<CR>", { noremap = true, unique = true })
vim.keymap.set("n", "<C-]>", ":tabp<CR>", { noremap = true })
vim.keymap.set("i", "<C-\\>", "<Esc>:tabn<CR>a", { noremap = true, unique = true })
vim.keymap.set("i", "<C-]>", "<Esc>:tabp<CR>a", { noremap = true })
vim.keymap.set("v", "<C-\\>", "<Esc>:tabn<CR>", { noremap = true, unique = true })
vim.keymap.set("v", "<C-]>", "<Esc>:tabp<CR>", { noremap = true })
