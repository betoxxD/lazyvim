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
  vim.cmd("w") -- Guarda el archivo antes de compilar

  -- Obtiene la extensión del archivo actual
  local ext = vim.fn.expand("%:e") -- %:e obtiene la extensión (c o cpp)
  local compiler, std_flag

  if ext == "c" then
    compiler = "gcc"
    std_flag = "-std=c11"
  else
    compiler = "g++"
    std_flag = "-std=c++17"
  end

  -- Obtiene la ruta base del archivo y el nombre del ejecutable
  local filepath = vim.fn.expand("%:p") -- Ruta absoluta del archivo fuente
  local output = vim.fn.expand("%:p:r") -- Ruta absoluta del ejecutable sin extensión

  -- Construye el comando
  local cmd = string.format(
    'split | terminal %s %s -Wall -Wextra -O2 -o "%s" "%s" && "%s"',
    compiler,
    std_flag,
    output,
    filepath,
    output
  )

  -- Ejecuta el comando
  vim.cmd(cmd)
end, { noremap = true, silent = true, desc = "Compile and run C/C++ code" })

-- Move the current line up or down
vim.keymap.set("n", "<leader>j", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move the current line down" })
vim.keymap.set("n", "<leader>k", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move the current line up" })
