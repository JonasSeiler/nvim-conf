return {
    'xiyaowong/transparent.nvim',
    config = function()
        require("transparent").setup ({
            groups = {
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                'EndOfBuffer',
            },
            extra_groups = {
                "FloatBorder",
                "NormalNC",        -- Non-current windows
                -- Telescope
                "TelescopeNormal",       -- Main Telescope window
                "TelescopeBorder",       -- Telescope borders
                "TelescopePromptNormal",  -- Prompt area (where you type)
                "TelescopePromptBorder",  -- Prompt border
                "TelescopeResultsNormal", -- Results list
                "TelescopePreviewNormal", -- Preview window
                "TelescopeSelection",
                -- Harpoon
                "HarpoonWindow",   -- Main Harpoon window
                "HarpoonBorder",  -- Harpoon border
                "HarpoonTitle",   -- Title bar (if any)
                "HarpoonActive",
                -- Mason
                "MasonNormal",
                "MasonHeader",

                -- Undotree
                "UndotreeBody",
                "UndotreeMain",
                "UndotreeFloat",

            },
            exclude_groups = {},
        })
    end,
}
