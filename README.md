# docker-ubuntu18.04-django3.0.2

Build Docker container

```
docker-compose build
```

Run the initial Django migrations

```
docker-compose run --rm web python manage.py migrate
```

Run `docker-compose up` and check `localhost:8000` to confirm that Django is running
