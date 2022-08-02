# README

## Initial setup

```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:migrate
```

