# makefile_mysql.mk
# MySQL client commands (requires: apt install mysql-client-core-8.0)

include .env

MYSQL_HOST := 127.0.0.1
MYSQL_PORT := 3306
MYSQL_CMD := mysql --host=$(MYSQL_HOST) --port=$(MYSQL_PORT) --user=root --password=$(MYSQL_ROOT_PASSWORD)
MYSQLDUMP_CMD := mysqldump --host=$(MYSQL_HOST) --port=$(MYSQL_PORT) --user=root --password=$(MYSQL_ROOT_PASSWORD)

.PHONY: mysql-shell mysql-databases mysql-dump mysql-restore

mysql-shell:
	$(MYSQL_CMD) $(MYSQL_DATABASE)

mysql-databases:
	$(MYSQL_CMD) -e "show databases;"

mysql-dump:
	@test -n "$(DB)" || (echo "Usage: make mysql-dump DB=mydb" && exit 1)
	@mkdir -p backups
	$(MYSQLDUMP_CMD) $(DB) | gzip > backups/$(DB)_$$(date +%Y%m%d_%H%M%S).sql.gz
	@echo "Dumped to backups/"
	@ls -1t backups/ | head -3

mysql-restore:
	@test -n "$(DB)" || (echo "Usage: make mysql-restore DB=mydb FILE=backups/mydb_20240101_120000.sql.gz" && exit 1)
	@test -n "$(FILE)" || (echo "Usage: make mysql-restore DB=mydb FILE=backups/mydb_20240101_120000.sql.gz" && exit 1)
	gunzip -c $(FILE) | $(MYSQL_CMD) $(DB)
