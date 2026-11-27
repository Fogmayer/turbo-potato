PIP = $(VENV)/bin/pip
PYTEST = $(VENV)/bin/pytest
VENV_PYTHON = $(VENV)/bin/python

.PHONY: all venv install run test clean

all: install

# Создание виртуального окружения
venv:
	$(PYTHON) -m venv $(VENV)

# Установка зависимостей из requirements.txt
install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Запуск основного приложения
run:
	$(VENV_PYTHON) src/main.py

# Запуск модульных тестов
test:
	$(PYTEST) tests/

# Очистка временных файлов и кэша
clean:
	rm -rf $(VENV) __pycache__ .pytest_cache src/__pycache__ src/*/__pycache__ tests/__pycache__
