conform = require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettier", "prettierd" } },
		typescript = { { "prettier", "prettierd" } },
		-- html = { {"htmlbeautifi" } },
		css = { { "prettier", "prettierd" } },
		json = { { "prettier", "prettierd" } },
		javascriptreact = { { "prettier", "prettierd" } },
		typescriptreact = { { "prettier", "prettierd" } },
		markdown = { { "prettier", "prettierd" } },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 200,
	},
})

-- vim.keymap.set({ "n", "v" }, "<leader>fmf", function()
-- 	conform.format({
-- 		lsp_fallback = true,
-- 		async = false,
-- 		timeout_ms = 100,
-- 	})
-- end)
