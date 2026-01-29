return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup({
            transparent_background = true,
            filter = "pro",
            inc_search = "background",
            background_clear = {
                "telescope",
            },
            overridePalette = function ()
                return {
                    dark2 = "#101014",
                    dark1 = "#16161E",
                    background = "#1A1B26",
                    text = "#C0CAF5",
                    accent1 = "#f7768e",
                    accent2 = "#7aa2f7",
                    accent3 = "#e0af68",
                    accent4 = "#9d7cd8",
                    accent5 = "#0DB9D7",
                    accent6 = "#9bfea4",
                    dimmed1 = "#d5d7e3",
                    dimmed2 = "#d7d8e0",
                    dimmed3 = "#95969f",
                    dimmed4 = "#98918b",
                    dimmed5 = "#16161e",
                }
            end
        }
        )
    end
}
