vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.colorcolumn = "0"
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.colorcolumn = "94"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_hl(0, "LineNr", { fg = "#ead84e" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "white", bold = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("x", "<leader>p", '"_dP', { silent = true })

local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end
vim.opt.swapfile = false
