require("onedarkpro").setup({
	highlights = {
		Comment = { italic = true },
		Directory = { bold = true },
		ErrorMsg = { italic = true, bold = true }
	},
	styles = {
		types = "italic",
		methods = "NONE",
		numbers = "NONE",
		strings = "NONE",
		comments = "italic",
		keywords = "bold,italic",
		constants = "NONE",
		functions = "italic",
		operators = "NONE",
		variables = "bold",
		parameters = "italic",
		conditionals = "italic",
		virtual_text = "NONE",
	}
})
-- comment = { italic = true },
-- keyword = { italic = true }, -- any other keyword
-- type = { italic = true }, -- (preferred) int, long, char, etc
-- storageclass = { italic = true }, -- static, register, volatile, etc
-- structure = { italic = true }, -- struct, union, enum, etc
-- parameter = { italic = true }, -- parameter pass in function
-- annotation = { italic = true },
-- tag_attribute = { italic = true }, -- attribute of tag in reactjs
