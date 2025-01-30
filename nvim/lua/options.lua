local vim = vim
local opt = vim.opt
-- tabs / indentation
opt.tabstop = 2 -- размер таба в пробелах
opt.shiftwidth = 2 -- длина отступа
opt.softtabstop = 2 --
opt.expandtab = true --
opt.smartindent = true --
opt.wrap = false -- не переводит на новую строку, когда строка слишком длинная

-- search
opt.incsearch = true -- показывает результаты поиска после каждой новой буквы
opt.ignorecase = true --
opt.smartcase = true -- если в шаблоне поиска есть заглавные буквы, то ignorecase = false
opt.hlsearch = false -- без выделения

-- appearance
opt.nu = true --
opt.signcolumn = "yes"
opt.cmdheight = 1 --
opt.scrolloff = 5 -- начать скроллить за 5 строк до конца
opt.completeopt = "menuone,noinsert,noselect" -- настройки подсказочного меню
vim.wo.fillchars = "eob: " -- чтобы убрать ~ внизу файла

-- behaviour
opt.splitright = true -- новое окно справа
opt.splitbelow = true -- новое окно снизу
opt.autochdir = false -- autochdir меняет cwd на файл с курсором
opt.mouse:append("a") -- курсор есть во всех режимах
opt.clipboard:append("unnamedplus") -- можно копипастить между вимом и остальным миром
