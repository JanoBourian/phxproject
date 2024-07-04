# phxproject
A phoenix framework code challenge. This is a REST API to work with books, authors and categories.


## Start docker container for postgresql database

```bash
docker run -d --name bookstore_dev -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e PGDATA=/var/lib/postgresql/data/pgdata -p 5432:5432 -v C:\\Users\\super\\Documents\\databases\\bookstore:/var/lib/postgresql/data -d postgres
```