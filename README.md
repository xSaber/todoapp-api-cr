A [Kemal](http://kemalcr.com/) and [Clear](https://github.com/anykeyh/clear/wiki/getting_started) based API application.

## Prepare
* Install [Crystal](https://crystal-lang.org/docs/installation/)
* Install [Shards](https://github.com/crystal-lang/shards) (Shards is usually distributed with Crystal itself)
* Install [Postgres](https://www.postgresql.org/docs/current/static/tutorial-install.html)
* Create a database (I am using `todoapp_dev`)
  ```bash
  createdb todoapp_dev
  ```
* Duplicate `.env.example` and rename it to `.env`
* Change `DATABASE_URL` in `.env`, for example `postgres://prutya@localhost/todoapp_dev`
* Optionally change `PORT` in `.env` to your favorite one
* Install packages
  ```bash
  shards install
  ```

## Launch
```bash
crystal run src/todo_app.cr
```

## Check
I am using [Postman](https://www.getpostman.com/) for testing my API apps. Try opening the `localhost:PORT/todo-groups/` url.
