return {
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        hint_prefix = " ",
        handler_opts = {
          border = "rounded",
        },
      })
    end,
  },
}
