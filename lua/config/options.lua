-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- vim.cmd("autocmd!") -- Очистка всех автокоманд перед добавлением новых

-- Функция для определения операционной системы
local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has("macunix")
local is_win = has("win32")
local is_linux = has("unix")
-- __________________________________________

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.wo.number = true -- Нумеровка строк
vim.opt.relativenumber = true -- Устанавливает относительную нумеровку строк

vim.opt.title = true -- Устанавливает заголовок терминала
vim.opt.autoindent = true -- Включает автоматическую подстановку отступов при вставке новой строки, чтобы она соответсвовала уровню отступа предыдущей
vim.opt.hlsearch = true -- Подсветка всех совпадений поискового шаблона
vim.opt.backup = false -- Отключает создание резеврных копий файла при сохранении
vim.opt.showcmd = true -- Включает отображение введенной команды в консоль
vim.opt.cmdheight = 1 -- Установка высоты командной строки
vim.opt.laststatus = 2 -- Всегда отображать строку состояния, "1" - отображать строку состояния, только когда в наличии более одного окна
vim.opt.expandtab = true -- Использование пробелов вместо символа табуляции
vim.opt.scrolloff = 12 -- Количество строк видимые сверху и снизу при прокрутке текста
if is_mac then
  vim.opt.shell = "/bin/zsh" -- Установка командной оболочки для выполнения команд
end
if is_linux then
  vim.opt.shell = "/bin/bash"
end
if is_win then
  vim.opt.shell = "C:\\WINDOWS\\system32\\cmd.exe" -- Установка командной оболочки для выполнения команд
end
vim.opt.inccommand = "split" -- Отображение результата изменения текста в реальном времени при вводе
vim.opt.ignorecase = true -- Игнорирование регистра букв при поиске текста
vim.opt.smarttab = true -- Умный подход при автоматическом добавлении отступов с использованием символов табуляции
vim.opt.breakindent = true -- Сохраняет отступ при автоматическом переносе строки
vim.opt.shiftwidth = 4 -- Количество пробелов при выполнении сдвига текста с помощью "<<" ">>"
vim.opt.tabstop = 4 -- Количество пробелов для отображения одного символа табуляции
vim.opt.ai = true -- Автоматическое добавление отступа на новой строке при создании ее с помощью enter
vim.opt.si = true -- Автоматическое определение уровня отступа при создании новых строк
vim.opt.wrap = false -- Отключение визуального переноса строк
vim.opt.backspace = "start,eol,indent" -- Настройка поведения backspace, indent - удаление автомат. вставленных пробелов, start - использование backspace перед начало строки, eol - в конце
vim.opt.path:append({ "**" }) -- Настройка поиска файлов, "**" рекурсивно искать файлы в подкаталогах
vim.opt.wildignore:append({ "*/node_modules/", ".pyc", "__pycache__" }) -- Игнорирование имен файлов во время автодополнения имен файлов при поиске
vim.o.exrc = true -- Искать в корне проекта файлы: {'.nvim.lua', '.exrc', '.nvimrc'}, нужны для надстройки вима для проекта

vim.cmd([[let &t_Cs = "\e[4:3m"]]) -- Настройка стиля текста, особенно подчеркивания
vim.cmd([[let &t_Ce = "\e[4:0m"]]) -- Настройка стиля текста, особенно подчеркивания

vim.opt.formatoptions:append({ "r" }) -- При форматирование следует воспринимать строки, начинающиеся с "*" как продолжение строки

-- highlight settings
vim.opt.cursorline = true -- Устанавливает подсветку строки на которой находится курсор
vim.opt.termguicolors = true -- Включение поддержки цветов, для более широкой настройки цветовой схемы
vim.opt.winblend = 0 -- Устанавливает степень прозрачности для неактивных окон
vim.opt.wildoptions = "pum" -- Устанавливает где будет отображаться меню с автодополнением
vim.opt.pumblend = 5 -- Устанавливает степень прозрачности для меню автозаполнения
vim.opt.background = "dark" -- Устанавливает цветовую схему 'dark'/'light'

vim.opt.clipboard = "unnamedplus" -- Дает доступ к системному буферу обмену
if is_mac or is_linux then
  vim.opt.clipboard:append({ "unnamedplus" }) -- Дает доступ к системному буферу обмену
end
if is_win then
  vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" }) -- Дает доступ к системному буферу обмену
end

vim.opt.completeopt = { "menu", "preview", "menuone" } -- Настройка меню автодополнения 'menu' 'noselect' 'preview' 'noinsert' 'menuone'
vim.opt.conceallevel = 0 -- Настройка, чтобы был видел markdown в файлах
vim.opt.hidden = true -- Для отображения буферов файлов
vim.opt.mouse = "a" -- Разрешение использование мыши
vim.opt.mousefocus = true -- Автоматически устанавливает фокус на окно где был последний щелчок мыши
vim.opt.showtabline = 2 -- Всегда отображать строку вкладок
vim.opt.smartcase = true -- Учитывать регистр при поиске только когда в запросе есть заглавные буквы
vim.opt.splitbelow = true -- При открытие нового вертикального окна, оно будет отображаться ниже текущего
vim.opt.splitright = true -- Новое вертикальное окно будет отображаться справа от текущего
vim.opt.swapfile = true -- Создавать файлы обмена для буферов, позволяет восстановить файл при сбое в системе
vim.opt.timeoutlen = 500 -- Время ожидания следующей клавиши для клавишного сочетания
vim.opt.undofile = true -- Включает хранение истории изменения файла
vim.opt.updatetime = 1000 -- Насколько часто записывать изменения в файл и обновлять статусную строку
vim.opt.writebackup = false -- Не создавать резервные файлы перед их изменением
vim.opt.numberwidth = 3 -- Минимальная ширина занимаемая номерами строк
vim.opt.signcolumn = "auto" -- Автоматически отображать колонку отведенную для отображаения икнок ошибок и тд.
vim.opt.spell = false -- Включить орфографию слов
vim.opt.spelllang = { "en", "ru" } -- Языки которые будут проверятся на орфографию
vim.opt.sidescrolloff = 5 -- Устанавливает количество столбцов отображаемых при горизонтальной прокрутке
vim.opt.autoread = true -- Автоматически перечитывать файл, если он был изменен вне Nvim
vim.opt.autowrite = true -- Автоматически сохранять файл при выходе из него
