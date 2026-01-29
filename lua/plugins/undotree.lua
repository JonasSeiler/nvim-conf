-- ~/.config/nvim/lua/plugins/undotree.lua
return {
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" }
        },
        options = {
            undotree_SetFocusWhenToggle = 1,

        },
    }
}

