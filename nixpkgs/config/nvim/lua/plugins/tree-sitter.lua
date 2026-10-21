-- Treesitter. Parsers come prebuilt from nixpkgs (see vim.nix).
-- Highlighting and incremental selection are built into Neovim 0.12;
-- nvim-treesitter supplies indentation, nvim-treesitter-textobjects the
-- function/class text objects.

vim.treesitter.language.register("systemverilog", "verilog")  -- Use the SystemVerilog parser for Verilog files

-- Highlighting and indentation for every filetype that has a parser
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
  callback = function(args)
    if pcall(vim.treesitter.start, args.buf) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Incremental selection: Neovim's built-in an / in / ]n / [n, also on the old keys
vim.keymap.set("n", "gnn", "van", { remap = true, desc = "Select treesitter node" })
vim.keymap.set("x", "grn", "an",  { remap = true, desc = "Expand to parent node" })
vim.keymap.set("x", "grc", "an",  { remap = true, desc = "Expand to parent node" })
vim.keymap.set("x", "grm", "in",  { remap = true, desc = "Shrink to child node" })
vim.keymap.set("x", ".",   "an",  { remap = true, desc = "Expand to parent node (was textsubjects-smart)" })

-- Text objects (replace textsubjects' container objects)
require("nvim-treesitter-textobjects").setup({ select = { lookahead = true } })
local select = require("nvim-treesitter-textobjects.select")
for lhs, capture in pairs({
  [";"]  = "@function.outer",
  ["i;"] = "@function.inner",
  ["ac"] = "@class.outer",
  ["ic"] = "@class.inner",
}) do
  vim.keymap.set({ "x", "o" }, lhs, function() select.select_textobject(capture, "textobjects") end,
    { desc = "Select " .. capture })
end
