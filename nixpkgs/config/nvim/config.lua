require('lsp')
require('plugins/lualine')
require('plugins/tree-sitter')
require('plugins/which-key')

-- BEGIN neogit
local neogit = require('neogit')

neogit.setup {}
-- END neogit

-- BEGIN nvim-solarized-lua
vim.cmd('colorscheme solarized')
-- END nvim-solarized-lua

-- BEGIN indent-blankline.nvim
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
-- END indent-blankline.nvim

-- BEGIN telescope.nvim
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
-- END telescope.nvim

-- BEGIN nvim-cursorline
vim.g.cursorword_highlight = true
-- END nvim-cursorline

-- BEGIN nvim-web-icons
require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "Zsh"
    }
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
-- END nvim-web-icons

-- BEGIN nvim-tree.lua
vim.g.nvim_tree_side = 'right' -- left by default
vim.g.nvim_tree_width = 40 -- 30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
vim.g.nvim_tree_gitignore = 1 -- 0 by default
vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_hijack_cursor = 0 -- 1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_update_cwd = 1 -- 0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    'packer',
    'qf'
  },
  buftype = {
    'terminal'
  }
}
--  Dictionary of buffer option names mapped to a list of option values that
--  indicates to the window picker that the buffer's window should not be
--  selectable.
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } --  List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
--  default = '',
--  symlink = '',
--  git = {
--    unstaged = "✗",
--    staged = "✓",
--    unmerged = "",
--    renamed = "➜",
--    untracked = "★",
--    deleted = "",
--    ignored = "◌"
--  },
--  folder = {
--    arrow_open = "",
--    arrow_closed = "",
--    default = "",
--    open = "",
--    empty = "",
--    empty_open = "",
--    symlink = "",
--    symlink_open = "",
--  },
--  lsp = {
--    hint = "",
--    info = "",
--    warning = "",
--    error = "",
--  }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- default mappings
--  ["<CR>"]           = tree_cb("edit"),
--  ["o"]              = tree_cb("edit"),
--  ["<2-LeftMouse>"]  = tree_cb("edit"),
--  ["<2-RightMouse>"] = tree_cb("cd"),
--  ["<C-]>"]          = tree_cb("cd"),
--  ["<C-v>"]          = tree_cb("vsplit"),
--  ["<C-x>"]          = tree_cb("split"),
--  ["<C-t>"]          = tree_cb("tabnew"),
--  ["<"]              = tree_cb("prev_sibling"),
--  [">"]              = tree_cb("next_sibling"),
--  ["<BS>"]           = tree_cb("close_node"),
--  ["<S-CR>"]         = tree_cb("close_node"),
--  ["<Tab>"]          = tree_cb("preview"),
--  ["I"]              = tree_cb("toggle_ignored"),
--  ["H"]              = tree_cb("toggle_dotfiles"),
--  ["R"]              = tree_cb("refresh"),
--  ["a"]              = tree_cb("create"),
--  ["d"]              = tree_cb("remove"),
--  ["r"]              = tree_cb("rename"),
--  ["<C-r>"]          = tree_cb("full_rename"),
--  ["x"]              = tree_cb("cut"),
--  ["c"]              = tree_cb("copy"),
--  ["p"]              = tree_cb("paste"),
--  ["y"]              = tree_cb("copy_name"),
--  ["Y"]              = tree_cb("copy_path"),
--  ["gy"]             = tree_cb("copy_absolute_path"),
--  ["[c"]             = tree_cb("prev_git_item"),
--  ["]c"]             = tree_cb("next_git_item"),
--  ["-"]              = tree_cb("dir_up"),
--  ["q"]              = tree_cb("close"),
}
-- END nvim-tree.lua
