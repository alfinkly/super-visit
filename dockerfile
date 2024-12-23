# Этап сборки
FROM golang:1.23 AS builder

WORKDIR /app

# Копируем файлы для модулей и устанавливаем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем остальные файлы проекта
COPY . .

# Сборка бинарного файла
RUN go build -o server cmd/main.go

# Этап запуска
FROM alpine:latest

WORKDIR /root/

# Копируем собранный бинарник из builder
COPY --from=builder /app/server .

# Убедимся, что приложение исполняемо
RUN chmod +x ./server

# Запуск приложения
CMD ["./server"]
