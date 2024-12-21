FROM python:3.12.1-alpine3.19

WORKDIR /app

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]