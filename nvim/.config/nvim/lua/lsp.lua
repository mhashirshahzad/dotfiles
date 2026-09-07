-- lsp
vim.lsp.enable({ "lua_ls", "tsgo", "rust_analyzer", "clangd" })
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.api.nvim_create_autocmd("TextChangedI", {
	callback = function()
		local col = vim.api.nvim_win_get_cursor(0)[2]
		local line = vim.api.nvim_get_current_line()

		if col > 0 and line:sub(col, col):match("[%w_]") then
			vim.lsp.completion.get()
		end
	end,
})


vim.keymap.set("i", "<Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-n>"
	end
	return "<Tab>"
end, { expr = true })

vim.keymap.set("i", "<S-Tab>", function()
	if vim.fn.pumvisible() == 1 then
		return "<C-p>"
	end
	return "<S-Tab>"
end, { expr = true })

vim.cmd("set completeopt+=noselect")
