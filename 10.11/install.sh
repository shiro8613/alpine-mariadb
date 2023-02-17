#!/bin/ash

#Check root
echo "Check root..."

#Install tools
echo "Install tools"
apk add git gcc g++ make bison ncurses cmake opensll --no-cache

#Install dependencies
echo "Install dependencies"
apk add libaio-dev ncurese-dev zlib-dev libevent-dev ncurses-dev libevent zstd-libs libcurl curl-dev zstd zstd-dev --no-cache
apk add gnutls-dev bzip2-dev lz4-dev lzo-dev snappy-dev xz-dev libxml2-dev boost-dev flex lz4 linux-pam-dev --no-cache

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

#Add user
echo "Add user"

#Ownership change
echo "Ownership change"

#Init database
echo "Init database"

#Regist service
echo "Regist service"

#Run mariadbd
echo "Run mariadbd"

