# Django 6.1 needs Python 3.12+
FROM python:3.13-slim

LABEL org.opencontainers.image.source="https://github.com/ralph-issa/ai-agent-cicd"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
