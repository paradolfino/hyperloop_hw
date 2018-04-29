From Aerogami/guides

# Postgresql setup

add the following to your gemfile:

`gem 'pg'`

and run the bundle command

`bundle install`

change your database.yml file with the following:

```yml
default: &default
      adapter: postgresql
      encoding: unicode
      pool: 5
      username: <%= ENV['USERNAME'] %>
      password: <%= ENV['PASSWORD'] %>

development:
  <<: *default
  database: app_development

test:
  <<: *default
  database: app_test

production:
  <<: *default
  database: app_production
```


## Initiate Postgresql

`$ sudo service postgresql start`

`$ sudo sudo -u postgres psql`

`postgres=# CREATE USER username SUPERUSER PASSWORD 'password';`

`postgres=# \q`


## Update template1 postgresql for database.yml on cloud9:

`$ sudo sudo -u postgres psql`

`postgres# UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';`

`postgres# DROP DATABASE template1;`

`postgres# CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';`

`postgres# UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';`

`postgres# \c template1`

`postgres# VACUUM FREEZE;`

`postgres# \q`

## Start server
rails server --binding 0.0.0.0 --port 8080
