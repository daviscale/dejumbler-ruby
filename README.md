# README

## Initial setup

```
cp .env.example .env
docker-compose build
docker-compose run --rm web bin/rails db:setup
docker-compose run --rm web bin/rails db:setup RAILS_ENV=test 
```

## Run specs

```
docker-compose run --rm web bundle exec rspec
```

## Heroko database setup

```
heroku run bin/bundle exec rake db:migrate
heroku run bin/bundle exec rake db:seed
```

The commands differ from local setup because there is no need to create a database on Heroku. [1]

[1] https://stackoverflow.com/a/50246160