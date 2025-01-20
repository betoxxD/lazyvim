-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

-- Compile and run C/C++ code in a split terminal
vim.keymap.set("n", "<leader>fw", function()
  vim.cmd("w")
  vim.cmd("split | terminal g++ -std=c++17 -Wall -Wextra -O2 -o %:r % && ./" .. vim.fn.expand("%:r"))
end, { noremap = true, silent = true, desc = "Compile and run C/C++ code" })

-- Move the current line up or down
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move the current line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move the current line up" })
