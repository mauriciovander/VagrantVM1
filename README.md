Step 1:   Install VirtualBox
Step 2:   Install Vagrant
Step 3:   clone git repository : git clone https://github.com/mauriciovander/VagrantVM1.git
Step 4:   cd into de new VagrantVM1 folder nd execute "vagrant up"
Step 5:   wait for the VM instalation to complete and start using it.

Host folder www is syncronized with /var/www in the VM environment
Other sync-folders are:

  www --> /var/www
  virtual-hosts --> /et/apache2/conf.d
  php-config-files --> /usr/share/php5

./db.sh will access the VM hosted MySQL database with root privileges

Configure your Apache VirtualHosts as if you were in the VM environment and configure your local DNS to point your local sites to 12.0.1.20.
(Yoy can change the IP in VagrantFile to whatever you like)

To access VM, use "vagrant ssh"

from the VM, execute sudo service apache2 restart every time you add or change a VirtualHost 

Enjoy !
