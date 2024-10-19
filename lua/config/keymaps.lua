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
  vim.cmd("terminal g++ -std=c++17 -Wall -Wextra -O2 -o %:r % && ./" .. vim.fn.expand("%:r"))
end, { noremap = true, silent = true, desc = "Compile and run C/C++ code" })
