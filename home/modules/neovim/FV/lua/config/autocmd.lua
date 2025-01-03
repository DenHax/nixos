local cmd = {}

-- Настройка строки состояния
vim.o.showmode = false -- Отключить стандартный режим отображения
vim.o.laststatus = 2 -- Всегда показывать строку состояния

-- Функция для отображения текущего буфера
function _G.statusline()
	local bufname = vim.fn.expand("%:t") -- Получить имя текущего буфера
	local bufnr = vim.fn.bufnr("%") -- Получить номер текущего буфера
	local buf_count = vim.fn.len(vim.fn.getbufinfo("%")) -- Получить количество буферов
	return string.format(" %s | Buffers: %d ", bufname, buf_count)
end

-- Установка строки состояния
vim.o.statusline = "%!v:lua.statusline()"
