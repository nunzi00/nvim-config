require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})
