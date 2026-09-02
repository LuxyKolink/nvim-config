-- OPTIONS
local set = vim.opt

-- line numbers
set.relativenumber = true
set.number = true

-- indentation
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true

-- search settings
set.ignorecase = true
set.smartcase = true

-- appearance
set.termguicolors = true
set.background = "dark"
set.signcolumn = "yes"

-- cursorline
set.cursorline = true

-- 80th col
set.colorcolumn = "80"

-- clipboard
set.clipboard:append("unnamedplus")

-- backspace
set.backspace = "indent,eol,start"

-- split windows
set.splitbelow = true
set.splitright = true

-- dw/diw/ciw works on full-word
set.iskeyword:append("-")

-- set cursor at least 8 rows from top/bottom
-- set cursor at least 8 rows from sides
set.scrolloff = 8
set.sidescrolloff = 8

-- undo dir settings
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

-- incremental search
set.incsearch = true

-- faster cursor hold
set.updatetime = 50

-- long lines wont wrap
set.wrap = false

-- no backup
set.writebackup = false

