  
-- BEGIN Which-Key
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
    f = { "<cmd>lua require('telescope.builtin').file_browser()<cr>",  "Lists files and folders in your current working directory, open files, navigate your filesystem, and create new files and folders" },
  },
  f = {
    name = "finders",
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>",       "Lists open buffers in current neovim instance" },
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>",    "Lists files in your current working directory, respects .gitignore" },
    l = { "<cmd>lua require('telescope.builtin').live_grep()<cr>",     "Search for a string in your current working directory and get results live as you type (respecting .gitignore)" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>",     "Lists available help tags and opens a new window with the relevant help info on <cr>" },
    s = { "<cmd>lua require('telescope.builtin').grep_string()<cr>",   "Searches for the string under your cursor in your current working directory" },
  },
}, { prefix = "<leader>", mode = "n" })

-- Insert Maps
wk.register({
  s = {
    name = "snippets",
    i = { "<Plug>(coc-snippets-expand)",         "Trigger snippet expand" },
    n = { "<Plug>(coc-snippets-expand-jump)",    "Expand and jump (make expand higher priority)" },
  },
}, { prefix = "<leader>", mode = "i" })

-- Visual Maps
wk.register({
  s = {
    name = "snippets",
    x = { "<Plug>(coc-convert-snippet)",         "Convert visual selected code to snippet" },
  },
}, { prefix = "<leader>", mode = "x" })

-- Visual/Select Maps
wk.register({
  s = {
    name = "snippets",
    n = { "<Plug>(coc-snippets-select)",         "Select text for visual placeholder of snippet" },
  },
}, { prefix = "<leader>", mode = "v" })


-- END Which-Key
