local wk = require("which-key")
wk.setup({})  -- initialise before adding mappings, or they are dropped

-- Normal mode maps (which-key v3 spec format)
wk.add({
  { "<leader>b",  group = "browsers" },
  { "<leader>bt", "<cmd>NvimTreeToggle<cr>",                                   desc = "Toggle file tree viewer" },

  { "<leader>f",  group = "finders" },
  { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>",       desc = "List open buffers" },
  { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>",    desc = "Lists files in CWD" },
  { "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep()<cr>",     desc = "Search for a string in your CWD" },
  { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>",     desc = "Lists available help tags" },
  { "<leader>fs", "<cmd>lua require('telescope.builtin').grep_string()<cr>",   desc = "Searches for the string under your cursor in your CWD" },

  { "<leader>h",  group = "hop" },
  { "<leader>hb", "<cmd>lua require'hop'.hint_char2()<cr>",    desc = "Hop to bigram (two characters)" },
  { "<leader>hc", "<cmd>lua require'hop'.hint_char1()<cr>",    desc = "Hop to character" },
  { "<leader>hl", "<cmd>lua require'hop'.hint_lines()<cr>",    desc = "Hop to line" },
  { "<leader>hp", "<cmd>lua require'hop'.hint_patterns()<cr>", desc = "Hop to pattern" },
  { "<leader>hw", "<cmd>lua require'hop'.hint_words()<cr>",    desc = "Hop to word" },

  { "<leader>w",  proxy = "<C-w>", group = "windows" },

  { "<leader>q",  group = "quit" },
  { "<leader>qb", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Close buffer without closing split" },
})
