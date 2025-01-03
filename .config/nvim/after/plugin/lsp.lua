local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>lws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>lof", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>lca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>lrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>lrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local border = {
	{ "╭", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╮", "CmpBorder" },
	{ "│", "CmpBorder" },
	{ "╯", "CmpBorder" },
	{ "─", "CmpBorder" },
	{ "╰", "CmpBorder" },
	{ "│", "CmpBorder" },
}
vim.g.completion_items_priority = {
  Field = 11,
  Method = 10,
  Property = 9,
  Function = 7,
  Variables = 6,
  Struct = 6,
  Interfaces = 6,
  Constant = 6,
  Class = 6,
  Keyword = 5,
  Treesitter = 4,
  File = 2,
  Buffers = 0,
}

cmp.setup({
	-- preselect = "item",
	-- completion = {
	-- 	completeopt = "menu,menuone,noinsert",
	-- },

	-- sources = cmp.config.sources({
	-- 	{ name = "nvim_lsp", priority = "9" },
	-- 	{ name = "luasnip", priority = "8" },
	-- 	{ name = "buffer", keyword_length = 5 },
	-- 	{ name = "npm", keyword_length = 2 },
	-- 	{ name = "neorg" },
	-- }),
	sources = {
		{ name = "path" },
		{ name = "luasnip", keyword_length = 2, priority="20" },
		{ name = "nvim_lsp", priority="19" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3 },
	},
	window = {
		documentation = {
			border = border,
		},
		completion = {
			border = border,
		},
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
