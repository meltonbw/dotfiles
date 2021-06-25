require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,  -- false will disable the whole extension
    custom_captures = {
    },
    disable = { },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-big',
    }
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
--    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.verilog.used_by = "systemverilog"
