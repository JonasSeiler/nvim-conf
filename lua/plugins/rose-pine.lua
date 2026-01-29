-- ~/.config/nvim/lua/plugins/rose-pine.lua
return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                disable_float_background = false,
                variant = "main", -- or "moon" or "dawn"
                dark_variant = "main",
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
                enable = {
                    terminal = true,
                    legacy_highlights = false,
                    migrations = true,
                },

                styles = {
                    bold = true,
                    italics = false,
                    transparency = false,
                },

                palette = {
                    main = {
                        love = "#b4637a"
                    }
                },
                groups = {

                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    colorcolumn = "love",
                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },
                highlight_groups = {
                    --TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    --TelescopeNormal = { bg = "none" },
                    --TelescopePromptNormal = { bg = "base" },
                    --TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    --TelescopeSelection = { fg = "text", bg = "base" },
                    --TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                    --Visual = { bg = "subtle", fg = "NONE"},
                },
                before_highlight = function (groups, highlight, palette)

                end,
            })
        end
    }
}
