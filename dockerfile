FROM python:3.12.1-alpine3.19

WORKDIR /app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache gcc musl-dev mariadb-connector-c-dev pkgconfig \
    && rm -rf /var/cache/apk/*

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
