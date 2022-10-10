# dc-mysql

git clone https://github.com/trigremm/dc-mysql.git

cd dc-mysql

cp .env.sample .env

vim .env

sudo docker-compose up -d

# connect to mysql
sudo apt install mysql-client-core-8.0

export $(cat .env | grep MYSQL_ROOT_PASSWORD)

mysql -h 127.0.0.1 -u root -p${MYSQL_ROOT_PASSWORD} -e "show databases"

mysql -h 127.0.0.1 -u root -p${MYSQL_ROOT_PASSWORD} -e "create database sample"
