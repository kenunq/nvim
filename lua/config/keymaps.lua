-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

local wk = require("which-key")
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
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true }) -- Tab перемещает на следующую вкладку
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>", { silent = true }) -- S-Tab перемещает на предыдущую вк ладку
vim.keymap.set("v", "<Tab>", ">") -- Tab перемещает выделенные строки на 1 таб вперед
vim.keymap.set("v", "<s-Tab>", "<") -- S-Tab перемещает выделенные строки на 1 таб назад
vim.keymap.set("n", "<leader>x", ":BufferLinePickClose<CR>", { silent = true }) -- Отображает буквы на лайне по которым можно закрыть вкладку
vim.keymap.set("n", "<leader>X", ":BufferLineCloseRight<CR>", { silent = true }) -- закрывает все вкладки справа от текущего

-- Неотрии
vim.keymap.set("n", "<leader>E", ":Neotree left reveal<CR>", { silent = true }) -- Открывает неотри слева экрана
vim.keymap.set("n", "<leader>e", ":Neotree float reveal<CR>", { silent = true }) -- открывает неотри по центру экрана
vim.keymap.set("n", "<leader>o", ":Neotree float git_status<CR>", { silent = true }) -- открывает неотри-гитстатус

-- Комменты
vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)")

-- сессии
vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
  noremap = true,
})

-- авто сохранение
vim.api.nvim_set_keymap("n", "<leader>cs", ":ASToggle<CR>", { silent = true, desc = "Auto-save(on-off)" })

-- Список проблем в проекте (открытых файлов в буфере)
vim.api.nvim_set_keymap("n", "<leader>ct", ":Trouble<CR>", { silent = true })

-- git signs
vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "Git preview change" })
vim.api.nvim_set_keymap("n", "<leader>gi", ":Gitsigns blame_line<CR>", { silent = true, desc = "Git change info" })

-- neotest
vim.api.nvim_set_keymap(
  "n",
  "<leader>tr",
  ":lua require('neotest').run.run()<CR>",
  { silent = true, desc = "Run current test" }
) -- Запускает тест на котором стоит курсор
vim.api.nvim_set_keymap(
  "n",
  "<leader>tR",
  ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { silent = true, desc = "Run all test in file" }
) -- Запускаем все тесты в файле
vim.api.nvim_set_keymap(
  "n",
  "<leader>ts",
  ":lua require('neotest').run.stop()<CR>",
  { silent = true, desc = "Stop current test" }
) -- Остановить тест
vim.api.nvim_set_keymap(
  "n",
  "<leader>ti",
  ":lua require('neotest').summary.toggle()<CR>",
  { silent = true, desc = "Open summary" }
) -- Откртыть все тесты в проекте
vim.api.nvim_set_keymap(
  "n",
  "<leader>to",
  ":lua require('neotest').output.open({ enter = true })<CR>",
  { silent = true, desc = "Test result" }
) -- Открыть панель вывода теста
vim.api.nvim_set_keymap(
  "n",
  "<leader>tO",
  ":lua require('neotest').output_panel.open()<CR>",
  { silent = true, desc = "Output panel" }
) -- Открыть общую панель вывода

wk.register({
  ["<leader>t"] = { name = "Tests" },
})
--------------------------------------------
require("lspconfig").pylsp.setup({
  on_attach = on_attach,
  flags = {
    -- This will be the default in neovim 0.7+
    debounce_text_changes = 150,
  },
  settings = {
    -- configure plugins in pylsp
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        pycodestyle = { enabled = false }, -- отключение pydocstyle lint
      },
    },
  },
})

require("lspconfig").pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python",
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off", --Disable Pyright diagnostics
      },
    },
  },
})

vim.api.nvim_set_keymap(
  "v",
  "<leader>a",
  ':lua require("highlight_plugin").wrap_text()<CR>',
  { noremap = true, silent = true }
)
