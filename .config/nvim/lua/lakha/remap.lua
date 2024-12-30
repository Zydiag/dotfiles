vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")




vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)


vim.keymap.set("v", "<leader>ks", ":Silicon<CR>")

vim.keymap.set("n", "<leader>cps", ":CompetiTest show_ui<CR>")
vim.keymap.set("n", "<leader>cpr", ":CompetiTest run<CR>")
vim.keymap.set("n", "<leader>cpa", ":CompetiTest add_testcase<CR>")
vim.keymap.set("n", "<leader>cpb", ":CompetiTest receive problem<CR>")

vim.api.nvim_set_keymap('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
vim.api.nvim_set_keymap('n', '<leader><leader>', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })


-- code runner keybind
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
-- vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
--
-- vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })



-- ## OBSIDIAN ## --

-- Obsidian.nvim keymaps
-- Place this in your init.lua or in a separate keymaps file

local opts = { noremap = true, silent = true }

-- Basic note operations
vim.keymap.set('n', '<leader>on', ':ObsidianNew ', opts)          -- Create new note
vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<CR>', opts)      -- Open note in Obsidian
vim.keymap.set('n', '<leader>os', ':ObsidianSearch<CR>', opts)    -- Search in vault
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', opts) -- Show backlinks
vim.keymap.set('n', '<leader>ot', ':ObsidianToday<CR>', opts)     -- Open/create daily note

-- Quick note navigation
vim.keymap.set('n', '<leader>of', ':ObsidianFollowLink<CR>', opts) -- Follow link under cursor
vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', opts)  -- View backlinks
vim.keymap.set('n', '<C-p>', ':ObsidianQuickSwitch<CR>', opts)     -- Quick switch between notes

-- Link operations
vim.keymap.set('n', '<leader>ol', ':ObsidianLink<CR>', opts)    -- Create link
vim.keymap.set('v', '<leader>ol', ':ObsidianLink<CR>', opts)    -- Create link with selected text
vim.keymap.set('n', '<leader>oe', ':ObsidianLinkNew<CR>', opts) -- Create and link to new note

-- Workspace operations
vim.keymap.set('n', '<leader>ow', ':ObsidianWorkspace<CR>', opts) -- Switch workspace
vim.keymap.set('n', '<leader>or', ':ObsidianRename<CR>', opts)    -- Rename current note

-- Template operations
vim.keymap.set('n', '<leader>oi', ':ObsidianTemplate<CR>', opts) -- Insert template

-- Tags and metadata
vim.keymap.set('n', '<leader>oT', ':ObsidianTags<CR>', opts)     -- View all tags
vim.keymap.set('n', '<leader>om', ':ObsidianMetadata<CR>', opts) -- Edit metadata
