local wk = require("which-key")
--require("which-key").setup {
--    -- your configuration comes here
--    -- or leave it empty to use the default settings
--    -- refer to the configuration section below
--}

-- Normal Maps
wk.register({
  b = {
    name = "browsers",
    t = { "<cmd>NvimTreeToggle<cr>",                                   "Toggle file tree viewer" },
    f = { "<cmd>lua require('telescope.builtin').file_browser()<cr>",  "Lists files and folders in your CWD" },
  },
  f = {
    name = "finders",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>",       "List open buffers" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>",    "Lists files in CWD" },
    l = { "<cmd>lua require('telescope.builtin').live_grep()<cr>",     "Search for a string in your CWD" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>",     "Lists available help tags" },
    s = { "<cmd>lua require('telescope.builtin').grep_string()<cr>",   "Searches for the string under your cursor in your CWD" },
  },
  h = {
    name = "hop",
    b = { "<cmd>lua require'hop'.hint_char2()<cr>",       "Hop to bigram (two characters)" },
    c = { "<cmd>lua require'hop'.hint_char1()<cr>",       "Hop to character" },
    l = { "<cmd>lua require'hop'.hint_lines()<cr>",       "Hop to line" },
    p = { "<cmd>lua require'hop'.hint_patterns()<cr>",    "Hop to pattern" },
    r = { "<cmd>lua require'hop'.refine_hints()<cr>",     "Refine hop hint" },
    w = { "<cmd>lua require'hop'.hint_words()<cr>",       "Hop to word" },
  },
  w = { "<C-w>", "Window commands", noremap=false },
  q = {
    name = "quit",
    b = { "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", "Close buffer without closing split" },
  },
},
{
  prefix = "<leader>",
  mode = 'n'
})

-- Insert Maps
--wk.register({
--  s = {
--    name = "snippets",
--    i = { "<Plug>(coc-snippets-expand)",         "Trigger snippet expand" },
--    n = { "<Plug>(coc-snippets-expand-jump)",    "Expand and jump (make expand higher priority)" },
--  },
--  [','] = { ",",                                 "Comma escape" },
--},
--{
--  prefix = "<leader>",
--  mode = "i"
--})

-- Visual Maps
wk.register({
  s = {
    name = "snippets",
    x = { "<Plug>(coc-convert-snippet)",         "Convert visual selected code to snippet" },
  },
},
{
  prefix = "<leader>",
  mode = "x"
})

-- Visual/Select Maps
wk.register({
  s = {
    name = "snippets",
    n = { "<Plug>(coc-snippets-select)",         "Select text for visual placeholder of snippet" },
  },
},
{
  prefix = "<leader>",
  mode = "v"
})
