local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

require("luasnip.loaders.from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

ls.add_snippets("all", {
	s("date", {
		i(1, os.date("%d.%m.%Y")),
	}),
	s("fn", {
		t("function "),
		i(1, "name"),
		t("("),
		i(2, "args"),
		t(") {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	})
})
ls.add_snippets("javascript", {
	s("clg", {
		t("console.log("),
		i(1, "args"),
		t(")"),
	})
})
ls.add_snippets("sh", {
	s("shbang",{
		t("#!/usr/bin/env bash"),
	}),
	s("fn", {
		t("function "),
		i(1, "name"),
		t("("),
		i(2, "args"),
		t(") {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	})
})
ls.add_snippets("cpp", {
	s("inc", {
		t("#include <bits/stdc++.h>"),
		-- t({ "", "" }),
		t("using namespace std;"),
		t({ "", "" }),
		-- t({ "", "" }),
		-- t("int main() {"),
		-- t({ "", "\t" }),
		-- i(0),
		-- t({ "", "" }),
		-- t({ "", "" }),
		-- t("\treturn 0;"),
		-- t({ "", "" }),
		-- t("}"),
	})
})
ls.add_snippets("cpp", {
    s("insta", {
        t("#include <bits/stdc++.h>"),
        t({ "", "" }),
        t("using namespace std;"),
        t({ "", "" }),
        t("int main() {"),
        t({ "", "\t" }),
        i(0),
        t({ "", "" }),
        t({ "", "" }),
        t("\treturn 0;"),
        t({ "", "" }),
        t("}"),
    }),
})

-- ls.add_snippets("cpp", {
-- 	s("insta", {
-- 		t("#include <bits/stdc++.h>"),
-- 		t({ "", "" }),
-- 		t("using namespace std;"),
-- 		t({ "", "" }),
-- 		t({ "", "" }),
-- 		t("int main() {"),
-- 		t({ "", "\t" }),
-- 		i(0),
-- 		i({ "", "\n" }),
-- 		i({ "", "" }),
-- 		t("return 0;"),
-- 		t({ "", "" }),
-- 		t("}"),
-- 	}),
-- })
ls.add_snippets("lua", {
	s("fn", {
		t("function "),
		i(1, "name"),
		t("("),
		i(2, "args"),
		t(") {"),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	})
})
