local opt = vim.opt
local g = vim.g

-- Set the leaders
g.mapleader = ','
g.maplocalleader = ' '

-- Disable modelines (for security)
opt.modeline = false
opt.modelines = 0

-- Get rid of the damn help key in all modes
vim.cmd("noremap <F1> <ESC>")
vim.cmd("noremap! <F1> <ESC>")

-- Default shell
opt.shell = "zsh"

-- Color settings
opt.termguicolors = true
vim.cmd("colorscheme solarized")

-- Tab Settings
opt.smarttab = true -- Insert tabstop number of spaces
opt.expandtab = true -- Convert tabs to spaces
opt.tabstop = 2 -- Indent using four spaces
opt.shiftround = true -- When shifting lines, round the indentation to the nearest multiple of shiftwidth
opt.shiftwidth = 2 -- When shifting, indent using four spaces
opt.softtabstop = 2 -- Don't use softtabstop

-- Cursor settings
opt.ruler = true -- Enable position indicator in lower right corner
opt.guicursor:append({ "a:blinkon0" }) -- Turn off cursor blinking
opt.backspace = "indent,eol,start" -- Configure allowed backspace behavior
opt.laststatus = 2 -- Enable status bar at the bottom of the screen
opt.matchtime = 3 -- 1/10 second delay before showing matching braces

-- Mouse
opt.mouse = 'a' -- Enable mouse
opt.mousefocus = false -- Disable mouse automatic focusing

-- Display
opt.linebreak = true -- Avoid wrapping a line in the middle of a work
opt.number = true -- Enable line numbering
opt.relativenumber = false -- Numbers are not relative to syntax
opt.cmdheight = 2 -- Give more space for displaying messages
opt.showcmd = true -- Show last command
opt.wildmenu = true -- Special command autocompletion
opt.wildmode = "list:longest" -- The mode for autocompletion
opt.visualbell = true -- Turn on visual feedback

-- Search settings
opt.ignorecase = true -- Case-insensitive searching
opt.smartcase = true -- Only case-sensitive when search has upper case characters
opt.wrapscan = true -- Searches wrap around the end of the file
opt.scrolloff = 5 -- Show a number of lines when scrolling for context
opt.gdefault = true -- The 'g' flag is set by default for substitute
opt.dictionary = "/usr/share/dict/words" -- Location of the dictionary

-- Movement settings
opt.showmatch = true -- When a bracket is inserted, temporarily move to the matching brace

-- Timings
opt.updatetime = 300  -- Number of milliseconds until swap file is written to disk
opt.timeout = true -- Enable timout for mapped key sequence
opt.timeoutlen = 500 -- Timeout length for mapped key sequence
opt.ttimeout = true -- Enable timout for key code sequence
opt.ttimeoutlen = 10 -- Timeout length for key code sequence

-- Windows and buffers
opt.hidden = true -- Allow switching unsaved buffers


as.aucmd('filetype-settings', {
  {
    events = { "FileType" },
    targets = { "systemverilog" },
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab",
  },
  {
    events = { "FileType" },
    targets = { "cpp" },
    command = "setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab",
  },
})

as.aucmd('filetype-detect', {
  {
    events = { "BufNewFile", "BufRead" },
    targets = { "*.f" },
    command = "setfiletype filelist",
  },
})
