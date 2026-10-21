-- indent-blankline v3 ("ibl"); treesitter is always used for scope.
require("ibl").setup({
  indent = { char = "┊" },
  scope = { enabled = true },  -- highlight the current context (was show_current_context)
})
