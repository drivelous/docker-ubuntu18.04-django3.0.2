# docker-ubuntu18.04-django3.0.2

## To build and run this container
Build Docker container

```
docker-compose build
```

Run the initial Django migrations

```
docker-compose run --rm web python manage.py migrate
```

Run `docker-compose up` and check `localhost:8000` to confirm that Django is running

## Issues

#### Cached layers
Cached layers can get stale. If your build fails on Step 4/13 `RUN apt-get -y install ...` re-build the image without the cache using `docker-compose build --no-cache`
