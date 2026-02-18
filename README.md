# dc-mysql

MySQL 8.0 + Adminer (web UI on port 8080).

## Quick start

```bash
cp .env.sample .env
vim .env
make up
```

## Commands

### Lifecycle

```
make d          # deploy (git pull + recreate)
make r          # recreate (build + stop + up)
make up         # start
make stop       # stop
make down       # stop and remove
make ps         # status
make l          # follow logs
```

### MySQL

Requires: `apt install mysql-client-core-8.0`

```
make mysql-shell          # connect to mysql shell
make mysql-databases      # show databases
make mysql-dump DB=mydb   # dump to backups/mydb_YYYYMMDD_HHMMSS.sql.gz
make mysql-restore DB=mydb FILE=backups/mydb_20240101_120000.sql.gz
```

## Adminer

Open http://localhost:8080 — web UI for database management.
