# dc-mysql

MySQL 8.0 + Adminer (web UI on port 8080).

## Quick start

```bash
cp .env.sample .env
cp .env.mybackup.sample .env.mybackup
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

All commands run inside Docker — no host dependencies required.

```
make mysql-shell          # connect to mysql shell
make mysql-databases      # show databases
make mysql-backup         # backup (sql.gz + schema-only) to .docker_volumes/backups/
make mysql-backup-shell   # interactive shell in backup container
```

## Adminer

Open http://localhost:8080 — web UI for database management.

## Backups

Backups are created via a separate Docker container (`mybackup`) that produces 2 files:
- `db_backup_<db>_<timestamp>.sql.gz` — full dump (gzipped)
- `db_schema_only_<db>_<timestamp>.sql` — schema only

Files are stored in `.docker_volumes/backups/`.
