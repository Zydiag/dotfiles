-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true
vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreeFloat guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreeLineNr guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreeCursorLine guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreeCursorColumn guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreeCursorLineNr guibg=NONE ctermbg=NONE]])
-- vim.cmd([[hi NvimTreePopup guibg=NONE ctermbg=NONE]])
vim.cmd([[hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE]])

-- NvimTreeNormal              Normal
-- NvimTreeNormalFloat         NormalFloat
-- NvimTreeNormalNC            NormalFloat
--
-- NvimTreeLineNr              LineNr
-- NvimTreeWinSeparator        WinSeparator
-- NvimTreeEndOfBuffer         EndOfBuffer
-- NvimTreePopup               Normal
-- NvimTreeSignColumn          NvimTreeNormal
--
-- NvimTreeCursorColumn        CursorColumn
-- NvimTreeCursorLine          CursorLine
-- NvimTreeCursorLineNr        CursorLineNr
--
-- NvimTreeStatusLine          StatusLine
-- NvimTreeStatusLineNC        StatusLineNC
-- empty setup using defaults

local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end

-- pass to setup along with your other options
require("nvim-tree").setup({
	on_attach = my_on_attach,
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		root_folder_modifier = ":t",
		-- These icons are visible when you install web-devicons
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		side = "left",
		preserve_window_proportions = true,
		width = 25,
	},
	update_focused_file = {
		enable = true,
		update_root = {
			enable = true,
		},
	},
	filters = {
		dotfiles = true,
	},
})
