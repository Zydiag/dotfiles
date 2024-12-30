require("tokyonight").setup({
	style = "night",
	styles = {
		-- Style to be applied to different syntax groups
		comments = { italic = true },
		keywords = { italic = true, bold = true },   -- Make keywords stand out
		functions = { italic = true },
		variables = {},                              -- Keep variables normal for better readability
		conditionals = { italic = true, bold = true }, -- Make conditionals prominent
		loops = { italic = true },
		numbers = { bold = true },                   -- Make numbers stand out
		types = { italic = true },
		strings = { italic = false },                -- Keep strings clean
		operators = { bold = true },                 -- Make operators visible
		-- Background styles
		sidebars = "dark",
		floats = "dark",
	},
	on_highlights = function(hl, c)
		-- Custom highlight groups
		hl.Function = { fg = c.blue, italic = true }
		hl.Conditional = { fg = c.magenta, italic = true, bold = true }
		hl.Type = { fg = c.blue1, italic = true }
		hl.Include = { fg = c.purple, italic = true }         -- import/include statements
		hl.Define = { fg = c.purple, bold = true }            -- preprocessor #define
		hl.Identifier = { fg = c.magenta }                    -- variable names
		hl.Boolean = { fg = c.orange, bold = true }           -- true/false
		hl.Statement = { fg = c.magenta, italic = true }
		hl.Special = { fg = c.orange, italic = true }         -- special symbols
		hl.Todo = { fg = c.purple, bold = true, italic = true } -- TODO/FIXME etc
	end,
	-- Other TokyoNight settings
	terminal_colors = true,
	day_brightness = 0.3,
	dim_inactive = false,
	lualine_bold = true,
})

-- Default options:
require('kanagawa').setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = false,  -- do not set background color
	dimInactive = false,  -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	-- colors = {            -- add/modify theme and palette colors
	-- 	palette = {},
	-- 	theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	-- },
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !

		light = "lotus"
	},
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none"
				}
			}
		}
	}
})

-- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")

-- vim.cmd.colorscheme("kanagawa")
vim.cmd.colorscheme("tokyonight")
