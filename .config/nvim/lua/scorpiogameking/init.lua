require("scorpiogameking/packer")
require("scorpiogameking/remap")
require("scorpiogameking/set")

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

vim.lsp.enable('gopls')
vim.lsp.enable('pylsp')

