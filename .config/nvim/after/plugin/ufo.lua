vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
	require("lspconfig")[ls].setup({
		capabilities = capabilities,
	})
end
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set("n", "zk", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.fn.CocActionAsync("definitionHover") -- coc.nvim
		vim.lsp.buf.hover()
	end
end)
require("ufo").setup()
--
