# docker-ubuntu18.04-django3.0.2

(bumped Django to 3.0.3 for security purposes)

## DEVELOPMENT CONTAINER: To build and run this container
Build Docker container

```
docker-compose build
```

Run the initial Django migrations

```
docker-compose run --rm web python manage.py migrate
```

Run `docker-compose up` and check `localhost:8989` to confirm that Django is running

## PRODUCTION CONTAINER: To build and run this container

If you have the development container running, run

```
docker-compose down -v
```

You may also need to add the `--remove-orphans` flag

Then run

```
docker-compose -f docker-compose.prod.yml up --build
docker-compose -f docker-compose.prod.yml exec web python3.8 manage.py migrate --noinput
docker-compose -f docker-compose.prod.yml exec web python3.8 manage.py collectstatic --no-input --clear
```

Check `localhost:1337` to confirm that Django is running

## Notes
This container uses python 3.8, which is not the version bundled with ubuntu18.04. Since we don't want to delete the bundled version, all python commands must be run with `python3.8` instead of `python`

## Issues

#### Cached layers
Cached layers can get stale. If your build fails on Step 4/13 `RUN apt-get -y install ...` re-build the image without the cache using `docker-compose build --no-cache`
