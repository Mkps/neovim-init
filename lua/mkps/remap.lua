vim.g.mapleader = " "
--allows you to go back easily to netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--allows you to move a visual select block around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
--keymap to allow your cursor to stay in place after a "J"
--vim.keymap.set("n", "J", "mzJ'z")
--keymap to allow your cursor to stay in place after a half-page jump (C-d || C-u)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keeps the current line in the middle while going through searches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- copies on deletion current selection to void register allowing you to replace it with you current buffer without losing it
vim.keymap.set("n", "<leader>p", "\"_dP")
-- allows copy to + register Credits asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
--tmux find and go
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer(<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
--quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":ClangdSwitchSourceHeader<CR>")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
