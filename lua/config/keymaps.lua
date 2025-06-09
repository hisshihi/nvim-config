-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("i", "jj", "<Esc>", { noremap = false })

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "📂 Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "🔍 Live grep" })
map("n", "<leader>fs", builtin.grep_string, { desc = "🔎 Grep string" })
