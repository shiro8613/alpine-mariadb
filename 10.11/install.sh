#!/bin/ash

#Check root
echo "Check root..."

#Install tools
echo "Install tools"
apk update
apk add git gcc g++ make bison ncurses cmake openssl --no-cache

#Install dependencies
echo "Install dependencies"
apk update
apk add libaio-dev zlib-dev libevent-dev ncurses-dev libevent zstd-libs libcurl curl-dev zstd zstd-dev
apk add gnutls-dev bzip2-dev lz4-dev lzo-dev snappy-dev xz-dev libxml2-dev boost-dev flex lz4 linux-pam-dev
apk add ncurses-dev 

#Clone mariadb source
echo "Clone mariadb source"
git clone https://github.com/MariaDB/server.git mariadb
cd mariadb
git checkout 10.11

#Run cmake
echo "Run cmake"
cmake . -DBUILD_CONFIG=mysql_release

#Run make install
echo "Run make install"
make install

#Get add files
echo "Get add files"
curl -o mariadb-init-d --url https://raw.githubusercontent.com/shiro8613/alpine-mariadb/master/10.11/mariadb-initd
curl -o my.cnf-df --url 

#Add user
echo "Add user"
adduser -D -H mariadb

#Add directory
echo "Add directory"
mkdir /run/mysqld

#Ownership change
echo "Ownership change"
chown -R mariadb:mariadb /usr/local/mysql
chown -R mariadb:mariadb /run/mysqld

#Regist service
echo "Regist service"


#Init database
echo "Init database"

#Run mariadbd
echo "Run mariadbd"

