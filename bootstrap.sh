#!/usr/bin/env bash

apt-get update

# HTTP server
apt-get install -y apache2

# MySQL
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
apt-get install -y mysql-server-5.5

# curl
apt-get install -y curl

# Memcached
apt-get install -y memcached

# SVN
apt-get install -y subversion

# PHP5 and libraries
apt-get install -y php5
apt-get install -y php5-mycrypt
apt-get install -y php5-mysql
apt-get install -y php5-uuid
apt-get install -y php5-curl
apt-get install -y php5-memcached

# GETTEXT
apt-get install gettext

apt-get install locales
locale-gen pt_BR.UTF-8
locale-gen es_ES.UTF-8
locale-gen zh_CN.UTF-8
locale-gen tr_TR.UTF-8
locale-gen pt_PT.UTF-8


if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/www /var/www
fi

if ! [ -L /etc/apache2/sites-enabled ]; then
  rm -rf /etc/apache2/sites-enabled
  ln -fs /vagrant/virtual-hosts /etc/apache2/sites-enabled
fi

if ! [ -L /usr/share/php5 ]; then
  rm -rf /usr/share/php5
  ln -fs /vagrant/php-config-files /usr/share/php5
fi

sudo sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf
sudo sed -i 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf

sudo sed -i 's/;include_path = ".:\/usr\/share\/php"/include_path = ".:\/usr\/share\/php5"/g' /etc/php5/apache2/php.ini
sudo sed -i 's/php55/php5"/g' /etc/php5/apache2/php.ini

sudo sed -i 's/;include_path = ".:\/usr\/share\/php"/include_path = ".:\/usr\/share\/php5"/g' /etc/php5/cli/php.ini
sudo sed -i 's/php55/php5"/g' /etc/php5/cli/php.ini

service mysql restart

mysql -uroot -proot -e "grant all privileges on *.* to 'root'@'%' with grant option;"

a2enmod rewrite
a2enmod ssl

service apache2 restart

