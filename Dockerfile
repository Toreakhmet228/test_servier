# Используем Python-образ
FROM python:3.10-slim

# Установка системных зависимостей
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libpq-dev

# Создаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Копируем проект
COPY . /app/

# Запускаем Uvicorn
CMD ["uvicorn", "sakoman.asgi:application", "--host", "0.0.0.0", "--port", "8000"]
