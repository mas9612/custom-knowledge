# custom-knowledge

Custom knowledge image to be able to set DB config from environmental variables.

## Run
```sh
$ docker run -d --name knowledge -e DB_USER=postgres -e DB_PASSWORD=mypassword mas9612/custom-knowledge
```

## Environmental variables
* `DB_URL` : Database URL
    - default: `postgresql://postgres:5432/knowledge`
* `DB_USER` : Database user to connect to database
    - default: `postgres`
* `DB_PASSWORD` : Database user's password
    - default: `dummy`
* `DB_SCHEMA` : Database schema
    - default: `public`
