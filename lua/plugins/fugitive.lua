 return {
  "tpope/vim-fugitive",
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit"
  },
  ft = { "fugitive" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Diff" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Commit" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Log" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },
  },
}
