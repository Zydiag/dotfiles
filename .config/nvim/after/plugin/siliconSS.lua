require("silicon").setup({
	-- Configuration here, or leave empty to use defaults
	font = "Cascadia Code NF=34;Noto Color Emoji=34",
	to_clipboard = true,
	-- line_number = true,
	tab_width = 2,
	pad_vert = 100,
	pad_horiz = 50,
	output = function()
		return "~/Pictures/ss/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
	end,
	-- watermark = {
	--   text = ' @Zydiag',
	-- },
	window_title = function()
		return vim.fn.fnamemodify(
			vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
			":~:."
		)
	end,
})
