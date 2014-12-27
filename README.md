Step 1:   Install VirtualBox
Step 2:   Install Vagrant
Step 3:   clone git repository
Step 4:   cd into de new folder nd execute "vagrant up"
Step 5:   wait for the VM instalation to complete and start using it.

Host folder www is syncronized with /var/www in the VM environment
Other sync-folders are:

  www --> /var/www
  virtual-hosts --> /et/apache2/conf.d
  php-config-files --> /usr/share/php5

./db.sh will access the VM hosted MySQL database with root privileges

To access VM, use "vagrant ssh"

Enjoy !
