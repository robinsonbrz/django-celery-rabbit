FROM python:3.11.6-alpine
RUN apk update \
    && apk add gcc libc-dev g++ libffi-dev libxml2 unixodbc-dev unixodbc mariadb-dev libstdc++ \
    && apk add bash icu-libs krb5-libs libgcc libintl libressl libstdc++ zlib curl gnupg curl-dev \
    && pip install --upgrade pip
ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

ENV PYTHONUNBUFFERED 1

# Atualiza o pip
RUN pip install --upgrade pip

RUN echo instalacao

WORKDIR /app

COPY . /app

# Copia o arquivo de requerimentos e instala as dependências
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

# Copy the startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh


