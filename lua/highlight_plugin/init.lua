local M = {}

-- Функция для получения выделенного текста
local function get_visual_selection()
  local _, line_start, col_start = unpack(vim.fn.getpos("'<"))
  local _, line_end, col_end = unpack(vim.fn.getpos("'>"))

  local lines = vim.fn.getline(line_start, line_end)
  if #lines == 0 then
    return ""
  end
  lines[#lines] = string.sub(lines[#lines], 1, col_end)
  lines[1] = string.sub(lines[1], col_start)

  return table.concat(lines, "\n"), line_start, line_end
end

-- Функция для отображения окна ввода
local function input(prompt_text)
  return vim.fn.input(prompt_text)
end

-- Основная функция для оборачивания текста
function M.wrap_text()
  -- Получаем выделенный текст и его позиции
  local selected_text, line_start, line_end = get_visual_selection()
  if selected_text == "" then
    return
  end

  -- Запрашиваем у пользователя ввод
  local user_input = input("Введите текст для оборачивания: ")

  -- Создаем обертку
  local up_wrapper_line = string.rep("#", 50) .. " " .. user_input .. " " .. string.rep("#", 50)
  local down_wrapper_line = string.rep("#", #up_wrapper_line)

  -- Добавляем обертку к выделенному тексту
  local wrapped_text = up_wrapper_line .. "\n" .. selected_text:gsub("\n", "\n") .. "\n" .. down_wrapper_line

  -- Заменяем выделенный текст на обернутый
  vim.api.nvim_buf_set_lines(0, line_start - 1, line_end, false, vim.split(wrapped_text, "\n"))
end

return M
