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

#Add user
echo "Add user"
adduser -D -H mariadb

#Add directory
echo "Add directory"
mkdir /run/mysqld

#Move cnf file
echo "Move file"
cd ..
rm -f /etc/my.cnf
rm -f /etc/my.cnf.d/*
mv -f my.cnf /etc/my.cnf

#Ownership change
echo "Ownership change"
chown -R mariadb:mariadb /usr/local/mysql
chown mariadb:mariadb /etc/my.cnf
chown -R mariadb:mariadb /run/mysqld

#Regist service
echo "Regist service"
cp mariadb-initd /etc/init.d/mariadb
chmod +x /etc/init.d/mariadb

#Init database
echo "Init database"
service mariadb setup

#Run mariadbd
echo "Run mariadbd"
service mariadb start

