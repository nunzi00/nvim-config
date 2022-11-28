local modules= {
"user.options",
"user.keymaps",
"user.plugins",
"user.colorscheme",
"user.cmp",
"user.lsp",
"user.telescope",
"user.gitsigns",
"user.treesitter",
"user.autopairs",
"user.comment",
"user.nvim-tree",
-- "user.bufferline",
"user.lualine",
"user.toggleterm",
-- "user.project",
-- "user.impatient",
-- "user.indentline",
"user.alpha",
"user.autocommands"
}
for k, v in pairs(modules) do
package.loaded[v]=nil
require(v)
end
