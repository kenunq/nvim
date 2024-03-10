-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
-- vim.g.mapleader = " "
keymap.set("n", "+", "<C-a>") -- Увеличение числа на +1
keymap.set("n", "-", "<C-x>") -- Уменьшение числа на -1

keymap.set("n", "dw", 'vb"_d') -- Удаление слова задомнаперед (без этого кеймапа, если курсор находится в конце слова, то слово не удалится)
keymap.set("n", "<C-a>", "gg<S-v>G") -- Выделить весь текст

keymap.set("n", "te", ":tabedit<enter>", { silent = true }) -- Создать новое окно          silent = true, для того, чтобы команда не отображалась в консоле
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true }) -- Разделение активного окна вертикально
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true }) -- Разделение активного окна горизонтально
-- keymap.set("n", "<Space>", "<C-w>w") -- Перемещение курсора на следующее окно
keymap.set("", "s<left>", "<C-w>h") -- Перемещение курсора на окно слева
keymap.set("", "s<up>", "<C-w>k") -- Перемещение курсора на окно сверху
keymap.set("", "s<down>", "<C-w>j") -- Перемещение курсора на окно снизу
keymap.set("", "s<right>", "<C-w>l") -- Перемещение курсора на окно справа
keymap.set("", "sh", "<C-w>h") -- Перемещение курсора на окно слева
keymap.set("", "sj", "<C-w>j") -- Перемещение курсора на окно сверху
keymap.set("", "sk", "<C-w>k") -- Перемещение курсора на окно снизу
keymap.set("", "sl", "<C-w>l") -- Перемещение курсора на окно справа
keymap.set("", "<C-w><left>", "<C-w><") -- Изменение размера активного окна влево
keymap.set("", "<C-w><right>", "<C-w>>") -- Изменение размера активного окна вправо
keymap.set("", "<C-w><up>", "<C-w>+") -- Изменение размера активного окна вверх
keymap.set("", "<C-w><down>", "<C-w>-") -- Изменение размера активного окна вниз
-- keymap.set("v", "<C-c>", '"+y') -- Копирование в буфер обмена
-- keymap.set("v", "<C-c>", "<Cmd>lua vim.api.nvim_command('normal! \"*y')<CR>")

-- буфер лайн
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Tab перемещает на следующую вкладку
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>") -- S-Tab перемещает на предыдущую вк ладку
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>") -- Отображает буквы на лайне по которым можно закрыть вкладку
vim.keymap.set("n", "<leader>X", ":BufferLineCloseRight<CR>") -- закрывает все вкладки справа от текущего

-- Неотрии
vim.keymap.set("n", "<leader>E", ":Neotree left reveal<CR>") -- Открывает неотри слева экрана
vim.keymap.set("n", "<leader>e", ":Neotree float reveal<CR>") -- открывает неотри по центру экрана
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>") -- открывает неотри-гитстатус
