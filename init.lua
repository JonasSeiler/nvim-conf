-- ~/.config/nvim/init.lua
vim.g.mapleader = " "
-- Load Lazy.nvim
require("config.lazy")

-- Set colorscheme (after plugins are loaded)
--vim.cmd.colorscheme("rose-pine")
vim.cmd.colorscheme([[monokai-pro]])

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--4 Space Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.winblend = 20
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.termguicolors = true

-- keep 10 lines above/below cursor while scrolling 
vim.opt.scrolloff = 10

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.g.netrw_cursor = 0

--vim.opt.colorcolumn = "80"

-- Remaps -------------------------------------
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)

-- allows moving highlighted text to move via J/K + indents correctly
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--centers cursor during half-page jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--jump through white spaces
vim.keymap.set("n", "<leader><space>", "f ")
vim.keymap.set("n", "<leader><S-<space>>", "F ")
-- using void registry to keep things in paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- yanking into system clipboard 
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- switch panes 
vim.keymap.set("n", "<leader><", '<C-w>h')
vim.keymap.set("n", "<leader>>", '<C-w>l')

-- search and replace word the cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- stop search highlighting
vim.keymap.set("n", "<leader>/", ":nohlsearch<cr>")

local function tmux_hoz_pane_in_dir()
    local file_path = vim.fn.expand('%:p:h')
    local tmux_cmd = 'tmux split-window -h -c ' .. vim.fn.shellescape(file_path)
    vim.fn.system(tmux_cmd)
end

local function tmux_vert_pane_in_dir()
    local file_path = vim.fn.expand('%:p:h')
    local tmux_cmd = 'tmux split-window -v -c ' .. vim.fn.shellescape(file_path)
    vim.fn.system(tmux_cmd)
end

local function tmux_win_in_dir()
    local file_path = vim.fn.expand('%:p:h')
    local tmux_cmd = 'tmux new-window -c ' .. vim.fn.shellescape(file_path)
    vim.fn.system(tmux_cmd)
end

vim.keymap.set("n", [[<leader>\]], tmux_hoz_pane_in_dir, {noremap = true, silent = true})
vim.keymap.set("n", [[<leader>=]], tmux_vert_pane_in_dir, {noremap = true, silent = true})
vim.keymap.set("n", [[<leader>`]], tmux_win_in_dir, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>dg", ":Neogen<CR>", {noremap = true, silent = true})
