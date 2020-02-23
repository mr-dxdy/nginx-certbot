Nginx + letsencrypt в одном docker-образе
===========================================

Перед запуском необходимо указать путь для хранения volumes:

- /etc/letsencrypt/
- /etc/nginx/conf.d/

В папку conf.d положить config of sites.
Для примера можно положить demo-conf:

```
server {
    listen 80;

    root /usr/share/nginx/html;
    try_files /index.html =404;
}
```

## Основные команды

- Запуск службы `make up`
- Остановка службы `make down`
- Список ssl-сертификатов: `make show_certificates`
- Создать сертификат: `make create_certificate`
- Тест на автоматическое обновление сертификатов: `make test_renewal_certificates`.

## Deploy of docker image

```
make build_image VERSION=<your version> # Example VERSION=0.0.1
make publish_image VERSION=<your version>
```
