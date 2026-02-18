# makefile_mysql.mk
# MySQL commands (all run inside Docker, no host dependencies)

.PHONY: mysql-shell mysql-databases mysql-backup mysql-backup-shell

mysql-shell:
	$(DC_BIN) exec mysql mysql -u root -p$${MYSQL_ROOT_PASSWORD} $${MYSQL_DATABASE}

mysql-databases:
	$(DC_BIN) exec mysql mysql -u root -p$${MYSQL_ROOT_PASSWORD} -e "show databases;"

mysql-backup:
	@touch .env.mybackup
	$(DC_BIN) run --rm mybackup

mysql-backup-shell:
	@touch .env.mybackup
	$(DC_BIN) run --rm -it --entrypoint bash mybackup
