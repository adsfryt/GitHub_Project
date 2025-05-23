FROM python:3.9

WORKDIR /app

COPY requirements.txt .  # Сначала копируем файл
RUN pip install -r requirements.txt

COPY . .  # Затем копируем весь код

EXPOSE 5000
CMD ["python", "app.py"]
